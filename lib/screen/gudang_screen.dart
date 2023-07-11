import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class GudangScreen extends StatefulWidget {
  @override
  _GudangScreenState createState() => _GudangScreenState();
}

class _GudangScreenState extends State<GudangScreen> {
  List<Map<String, dynamic>> barangMasukList = [];

  @override
  void initState() {
    super.initState();
    loadSavedList();
  }

  Future<void> loadSavedList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedList = prefs.getStringList('barang_masuk_list');

    if (savedList != null) {
      setState(() {
        barangMasukList = savedList.map((barang) => Map<String, dynamic>.from(json.decode(barang))).toList();
      });
    }
  }

  Future<void> saveList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedList = barangMasukList.map((barang) => json.encode(barang)).toList();
    await prefs.setStringList('barang_masuk_list', encodedList);
  }

  void tambahBarangMasuk(String namaBarang, bool isDiterima, int jumlah, String jenis) {
    setState(() {
      barangMasukList.add({
        'namaBarang': namaBarang,
        'isDiterima': isDiterima ? 'Diterima' : 'Ditolak',
        'jumlah': jumlah,
        'jenis': jenis,
      });
    });

    saveList();
  }

  void resetBarangMasuk() {
    setState(() {
      barangMasukList.clear();
    });

    saveList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gudang'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Nama Barang')),
                    DataColumn(label: Text('Status')),
                    DataColumn(label: Text('Jumlah')),
                    DataColumn(label: Text('Jenis')),
                  ],
                  rows: barangMasukList.map(
                    (barang) {
                      return DataRow(
                        cells: [
                          DataCell(Text(barang['namaBarang'])),
                          DataCell(Text(barang['isDiterima'])),
                          DataCell(Text(barang['jumlah'].toString())),
                          DataCell(Text(barang['jenis'])),
                        ],
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    String namaBarang = '';
                    bool isDiterima = false;
                    int jumlah = 0;
                    String jenis = '';

                    return AlertDialog(
                      title: Text('Tambah Barang Masuk'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            onChanged: (value) {
                              namaBarang = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'Barang',
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            onChanged: (value) {
                              jumlah = int.tryParse(value) ?? 0;
                            },
                            decoration: InputDecoration(
                              labelText: 'Jumlah',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 16),
                          TextField(
                            onChanged: (value) {
                              jenis = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'Jenis',
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  isDiterima = true;
                                  tambahBarangMasuk(namaBarang, isDiterima, jumlah, jenis);
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                                child: Text('Diterima'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  isDiterima = false;
                                  tambahBarangMasuk(namaBarang, isDiterima, jumlah, jenis);
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                ),
                                child: Text('Ditolak'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text(
                'Tambah Barang Masuk',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              ),
            ),
          ),
          Visibility(
            visible: barangMasukList.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: resetBarangMasuk,
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                ),
                child: Text(
                  'Reset',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
