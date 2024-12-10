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
                    'images/Jessy.jpeg',
                    height: 180,
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Welcome to Contact List',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Your go-to app for managing contacts!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Montserrat',
                    fontStyle: FontStyle.italic,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 50),
                // Customized Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DynamicBottomNavbar(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    foregroundColor: const Color.fromARGB(255, 51, 116, 182),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadowColor: Colors.blueGrey,
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 28,
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Lato',
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