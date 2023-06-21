import 'package:flutter/material.dart';
import 'package:tugas_kelompok_ahir/models/user_repository.dart';

import 'package:tugas_kelompok_ahir/screen/login_screen.dart';

void main() {
  runApp(Tugas_kelompok_ahir());
}

class Tugas_kelompok_ahir extends StatelessWidget {
  final UserRepository _userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Data Kariawan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false, 
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(_userRepository),
      },
    );
  }
}
