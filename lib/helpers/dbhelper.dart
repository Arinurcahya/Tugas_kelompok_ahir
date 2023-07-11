
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path_provider/path_provider.dart';
import 'package:tugas_kelompok_ahir/models/user.dart';
import 'package:tugas_kelompok_ahir/Models/user_datakaryawan.dart';


class DbHelper {
  static sqflite.Database? _database;
  static final DbHelper instance = DbHelper._getInstance();

  DbHelper._getInstance();

  Future<sqflite.Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<sqflite.Database> _initDatabase() async {
    final documentDirectory= await getApplicationDocumentsDirectory();
    final Path = path.join(documentDirectory.path, 'tugas_kelompok_ahir');

    return await sqflite.openDatabase(
      Path,  
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(sqflite.Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
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

  Future<int> insertUser(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert('users', row);
  }

  Future<Map<String, dynamic>> getUser(String username) async {
    final db = await instance.database;
    final result = await db.query('users',
        where: 'username = ?', whereArgs: [username], limit: 1);

    return result.isNotEmpty ? result.first : {};
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
