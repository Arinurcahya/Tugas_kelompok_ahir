import 'package:flutter/material.dart';
import 'package:tugas_kelompok_ahir/models/user.dart';
import 'package:tugas_kelompok_ahir/models/user_repository.dart';
import 'package:tugas_kelompok_ahir/screen/inputkaryawan_screen.dart';
import 'package:tugas_kelompok_ahir/screen/profil_screen.dart';
import 'package:tugas_kelompok_ahir/screen/gudang_screen.dart';
import 'package:tugas_kelompok_ahir/screen/berita_screen.dart';

class HomeScreen extends StatefulWidget {
  final UserRepository userRepository;

  const HomeScreen({required this.userRepository});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<User>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _usersFuture = widget.userRepository.getUsers();
  }

  void _goToAddScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InputKaryawanScreen(
          userRepository: widget.userRepository,
        ),
      ),
    );
  }

  void _goToProfileScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(),
      ),
    );
  }

  void _goToGudangScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GudangScreen(),
      ),
    );
  }

  void _goToBeritaScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BeritaScreen(),
      ),
    );
  }

  void _goToHomeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(userRepository: widget.userRepository),
      ),
    );
  }

  void _goToKaryawanScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InputKaryawanScreen(userRepository: widget.userRepository),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MENU'),
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder<List<User>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/karet.jpg'), // Replace with your background image path
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 80,
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/logo.jpg', 
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'PT Rubber Indonesia',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    padding: EdgeInsets.all(16.0),
                    childAspectRatio: 1.0, // Adjust the value to change the card size
                    mainAxisSpacing: 50.0,
                    crossAxisSpacing: 100.0,
                    children: [
                      GestureDetector(
                        onTap: _goToProfileScreen,
                        child: Card(
                          color: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.orange,
                                child: Icon(Icons.person, color: Colors.white),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Profil',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _goToAddScreen,
                        child: Card(
                          color: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.orange,
                                child: Icon(Icons.people, color: Colors.white),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Karyawan',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          ),
                      ),
                      GestureDetector(
                        onTap: _goToGudangScreen,
                        child: Card(
                          color: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.orange,
                                child: Icon(Icons.warehouse, color: Colors.white),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Gudang',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _goToBeritaScreen,
                        child: Card(
                          color: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.orange,
                                child: Icon(Icons.newspaper, color: Colors.white),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Berita',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNavigationButton('Beranda', Icons.home, _goToHomeScreen),
                      _buildNavigationButton('Karyawan', Icons.people, _goToKaryawanScreen),
                      _buildNavigationButton('Gudang', Icons.warehouse, _goToGudangScreen),
                      _buildNavigationButton('Berita', Icons.newspaper, _goToBeritaScreen),
                    ],
                  ),
                ),
              ],
           
          ),
        );
      },
    ),
  );
}

Widget _buildNavigationButton(String label, IconData icon, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        SizedBox(height: 4.0),
        Text(label),
      ],
    ),
  );
}
}