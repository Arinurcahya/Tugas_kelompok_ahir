import 'package:tugas_kelompok_ahir/helpers/dbhelper.dart';
import 'package:tugas_kelompok_ahir/models/user.dart';
import 'package:tugas_kelompok_ahir/Models/user_datakaryawan.dart';

class UserRepository {
  final DbHelper dbHelper = DbHelper.instance;

  Future<List<User>> getUsers() async {
    return dbHelper.getUsers();
  }

  Future<bool> login(String email, String password) async {
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

   Future<void> createKaryawan(DataKaryawan karyawan) async {
    await dbHelper.createKaryawanTable(); 
    return dbHelper.insertKaryawan(karyawan);
  }

  Future<List<DataKaryawan>> getDataKaryawan() async {
    return dbHelper.getKaryawan();
  }
    
  
}