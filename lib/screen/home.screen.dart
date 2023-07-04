import 'package:flutter/material.dart';
import 'package:tugas_kelompok_ahir/models/user.dart';
import 'package:tugas_kelompok_ahir/models/user_repository.dart';
import 'package:tugas_kelompok_ahir/screen/edit_screen.dart';
import 'package:tugas_kelompok_ahir/screen/inputkaryawan_screen.dart';


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MENU'),
      ),
      body: FutureBuilder<List<User>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final List<User> employees = snapshot.data ?? [];

          return ListView.builder(
            itemCount: employees.length,
            itemBuilder: (context, index) {
              final User employee = employees[index];
              return ListTile(
                title: Text(employee.name),
                subtitle: Text(employee.email),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditScreen(
                        user: employee,
                        userRepository: widget.userRepository,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    FloatingActionButton(
      onPressed: _goToProfileScreen,
      child: Icon(Icons.person),
    ),
    SizedBox(width: 16.0),
    FloatingActionButton(
      onPressed: _goToAddScreen,
      child: Icon(Icons.people),
    ),
    SizedBox(width: 16.0)
  ],
),
    );
  }
}