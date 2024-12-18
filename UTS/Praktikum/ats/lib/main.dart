import 'package:ats/bottom_navbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: DynamicBottomNavbar(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 73, 163, 180),
                  Color.fromARGB(255, 92, 145, 208),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Circular Profile Image
                ClipOval(
                  child: Image.asset(
                    'images/Jessy.jpeg', // Ganti dengan path gambar profil Anda
                    height: 180,
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 30),
                // Nama
                const Text(
                  'Nama: Nida Sakina Aulia',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                // NPM
                const Text(
                  'NPM: 714220040',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 10),
                // Kelas
                const Text(
                  'Kelas: 3B D4 Teknik Informatika',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}