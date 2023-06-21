import 'package:tugas_kelompok_ahir/helpers/dbhelper.dart';
import 'package:tugas_kelompok_ahir/models/user.dart';

class UserRepository {
  final DbHelper dbHelper = DbHelper.instance;

  Future<List<User>> getUsers() async {
    return dbHelper.getUsers();
  }

  Future<bool> login(String email, String password) async {
    // Implement your login logic here
    // Return true if login is successful, false otherwise
    return true;
  }

  Future<void> createUser(User user) async {
    return dbHelper.insertUser(user);
  }

  Future<void> updateUser(User user) async {
    return dbHelper.updateUser(user);
  }

  Future<void> deleteUser(int userId) async {
    return dbHelper.deleteUser(userId);
  }

  Future<void> createKaryawan(karyawan) async {
    // Implement your karyawan creation logic here
    // For example, you can insert the karyawan into the database using dbHelper
    // dbHelper.insertKaryawan(karyawan);
  }
}