import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Pengembang'),
        backgroundColor: Color.fromARGB(255, 120, 5, 5),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 13, 0, 95), const Color.fromARGB(255, 13, 0, 95)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title: Text(
                  'Name Developer:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                subtitle: Text('Gunawan Adi Kusuma',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.confirmation_number, color: Colors.white),
                title: Text('NPM:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                subtitle: Text('2110020028',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.school, color: Colors.white),
                title: Text('Kelas:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                subtitle: Text(
                    '5F SI SISTEM INFORMASI REGULER MALAM BANJARMASIN',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.phone, color: Colors.white),
                title: Text('Kontak:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                subtitle: Text('0831-5996-9081',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.location_on, color: Colors.white),
                title: Text('Alamat:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                subtitle: Text(
                  'Jl. Caraka Jaya',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
