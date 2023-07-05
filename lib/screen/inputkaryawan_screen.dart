import 'package:flutter/material.dart';
import 'package:tugas_kelompok_ahir/Models/user_datakaryawan.dart';
import 'package:tugas_kelompok_ahir/models/user_repository.dart';
import 'package:tugas_kelompok_ahir/screen/datakaryawan_screen.dart';


class InputKaryawanScreen extends StatefulWidget {
  final UserRepository userRepository;

  InputKaryawanScreen({required this.userRepository});

  @override
  _InputKaryawanScreenState createState() => _InputKaryawanScreenState();
}

class _InputKaryawanScreenState extends State<InputKaryawanScreen> {
  TextEditingController _nikController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();

  List<DataKaryawan> karyawanList = [];

  void _submitData() async {
    String nik = _nikController.text.trim();
    String nama = _namaController.text.trim();
    String email = _emailController.text.trim();
    String alamat = _alamatController.text.trim();

    if (nik.isEmpty || nama.isEmpty || email.isEmpty || alamat.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter all fields.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    DataKaryawan karyawan = DataKaryawan(
      nik: nik,
      nama: nama,
      email: email,
      alamat: alamat,
    );

    try{
    await widget.userRepository.createKaryawan(karyawan);
  
    _nikController.clear();
    _namaController.clear();
    _emailController.clear();
    _alamatController.clear();
         showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Data karyawan saved successfully.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to save data. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Karyawan'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nikController,
              decoration: InputDecoration(labelText: 'NIK'),
            ),
             SizedBox(height: 16.0),
            TextFormField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _alamatController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _submitData,
              child: Text('Submit'),
            ),
            SizedBox(height: 24.0),
           ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataKaryawanScreen(
                      userRepository: widget.userRepository,
                    ),
                  ),
                );
              },
              child: Text('View Data Karyawan'),
            ),
          ],
        ),
      ),
    );
  }
}