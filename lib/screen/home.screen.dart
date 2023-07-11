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