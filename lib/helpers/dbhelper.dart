import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path_provider/path_provider.dart';
import 'package:tugas_kelompok_ahir/models/user.dart';
import 'package:tugas_kelompok_ahir/Models/user_datakaryawan.dart';


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
      await db.execute('''
      CREATE TABLE karyawan (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nik TEXT,
        nama TEXT,
        email TEXT,
        alamat TEXT
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

   Future<void> insertKaryawan(DataKaryawan karyawan) async {
    final sqflite.Database db = await instance.database;
    await db.insert('karyawan', karyawan.toJson());
  }

  Future<List<DataKaryawan>> getKaryawan() async {
    final sqflite.Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('karyawan');
    return List.generate(maps.length, (index) {
      return DataKaryawan(
        nik: maps[index]['nik'],
        nama: maps[index]['nama'],
        email: maps[index]['email'],
        alamat: maps[index]['alamat'],
      );
    });
  }

  Future<void> createKaryawanTable() async {
    final sqflite.Database db = await instance.database;
    await db.execute('''
      CREATE TABLE IF NOT EXISTS karyawan (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nik TEXT,
        nama TEXT,
        email TEXT,
        alamat TEXT
      )
    ''');
  }
}
