import 'package:flutter/material.dart';
import 'package:tugas_kelompok_ahir/Models/user_datakaryawan.dart';
import 'package:tugas_kelompok_ahir/models/user_repository.dart';

class DataKaryawanScreen extends StatefulWidget {
  final UserRepository userRepository;

  DataKaryawanScreen({required this.userRepository});

  @override
  _DataKaryawanScreenState createState() => _DataKaryawanScreenState();
}

class _DataKaryawanScreenState extends State<DataKaryawanScreen> {
  List<DataKaryawan> dataKaryawanList = [];

  @override
  void initState() {
    super.initState();
    _loadDataKaryawan();
  }

  void _loadDataKaryawan() async {
    List<DataKaryawan> karyawanList =
        await widget.userRepository.getDataKaryawan();
    setState(() {
      dataKaryawanList = karyawanList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Karyawan'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dataKaryawanList.length,
          itemBuilder: (BuildContext context, int index) {
            DataKaryawan karyawan = dataKaryawanList[index];

            return Card(
              child: ListTile(
                title: Text('NIK: ${karyawan.nik}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama: ${karyawan.nama}'),
                    Text('Email: ${karyawan.email}'),
                    Text('Alamat: ${karyawan.alamat}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
