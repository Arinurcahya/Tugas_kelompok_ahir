import 'package:flutter/material.dart';
import 'package:tugas_kelompok_ahir/models/user_model.dart';
import 'package:tugas_kelompok_ahir/models/user_repository.dart';


class InputKaryawanScreen extends StatefulWidget {
  final UserRepository userRepository;

  InputKaryawanScreen({required this.userRepository});

  @override
  _InputKaryawanScreenState createState() => _InputKaryawanScreenState();
}

class _InputKaryawanScreenState extends State<InputKaryawanScreen> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _posisiController = TextEditingController();

  List<DataKaryawan> karyawanList = [];

  void _submitData() {
    String nama = _namaController.text.trim();
    String email = _emailController.text.trim();
    String posisi = _posisiController.text.trim();

    if (nama.isEmpty || email.isEmpty ||  posisi.isEmpty) {
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
      nama: nama,
      email: email,
      posisi: posisi,
    );

    setState(() {
      karyawanList.add(karyawan);
    });

    widget.userRepository.createKaryawan(karyawan);

    _namaController.clear();
    _emailController.clear();
    _posisiController.clear();
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
              controller: _posisiController,
              decoration: InputDecoration(labelText: 'Posisi'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _submitData,
              child: Text('Submit'),
            ),
            SizedBox(height: 24.0),
            Text(
              'Data Karyawan',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            DataTable(
              columns: [
                DataColumn(label: Text('Nama')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Posisi')),
              ],
              rows: karyawanList.map((karyawan) {
                return DataRow(cells: [
                  DataCell(Text(karyawan.nama)),
                  DataCell(Text(karyawan.email)),
                  DataCell(Text(karyawan.posisi)),
                ]);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}