import 'package:tugas_besar/bottom_navbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital Management System',
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
                  Color(0xFFB3E5FC), // Pastel Sky Blue
                  Color(0xFF81D4FA), // Lighter Blue
                ],
                begin: Alignment.topLeft,
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
                    'images/hospital_logo.png', // Ganti dengan path logo rumah sakit Anda
                    height: 180,
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 30),
                // Nama Aplikasi
                const Text(
                  'Hospital Management System',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black26,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Deskripsi Aplikasi
                const Text(
                  'Manage Patient Data Efficiently',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Roboto',
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 10),
                // Informasi Tambahan
                const Text(
                  'Your Reliable Partner in Healthcare Administration',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                    color: Colors.white60,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),
                // Deskripsi Tambahan
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Hospital Management System adalah aplikasi yang dirancang untuk membantu administrasi rumah sakit dalam mengelola data pasien dengan lebih efisien. Dengan fitur seperti manajemen data pasien, keamanan data tinggi, dan antarmuka yang intuitif, aplikasi ini menjadi solusi modern untuk meningkatkan produktivitas dan keakuratan informasi rumah sakit.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 30),
                // Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF0288D1), // Sky Blue for text
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(color: Color(0xFF81D4FA), width: 2),
                    ),
                  ),
                  onPressed: () {
                    // Add navigation functionality here
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
