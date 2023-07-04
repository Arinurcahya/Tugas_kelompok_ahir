class DataKaryawan {
  final String nik;
  final String nama;
  final String email;
  final String alamat;

  DataKaryawan({
    required this.nik,
    required this.nama,
    required this.email,
    required this.alamat,
  });

  Map<String, dynamic> toJson() {
    return {
      'nik': nik,
      'nama': nama,
      'email': email,
      'alamat': alamat,
    };
  }
}