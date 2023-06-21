import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path_provider/path_provider.dart';
import 'package:tugas_kelompok_ahir/Models/user.dart';

class DbHelper {
  static sqflite.Database? _database;
  static final DbHelper instance = DbHelper._();

  DbHelper._();

  Future<sqflite.Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<sqflite.Database> _initDatabase() async {
    final String dbPath = await _getDatabasePath();
    return await sqflite.openDatabase(
      dbPath,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<String> _getDatabasePath() async {
    final directory = await getApplicationDocumentsDirectory();
    final String dbPath = path.join(directory.path, 'sawit_registration.db');
    return dbPath;
  }

  Future<void> _createDatabase(sqflite.Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        password TEXT
      )
    ''');
  }

  Future<List<User>> getUsers() async {
    final sqflite.Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (index) {
      return User(
        id: maps[index]['id'],
        name: maps[index]['name'],
        email: maps[index]['email'],
        password: maps[index]['password'],
      );
    });
  }

  Future<void> insertUser(User user) async {
    final sqflite.Database db = await instance.database;
    await db.insert('users', user.toJson());
  }

  Future<void> updateUser(User user) async {
    final sqflite.Database db = await instance.database;
    await db.update(
      'users',
      user.toJson(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<void> deleteUser(int id) async {
    final sqflite.Database db = await instance.database;
    await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
jb