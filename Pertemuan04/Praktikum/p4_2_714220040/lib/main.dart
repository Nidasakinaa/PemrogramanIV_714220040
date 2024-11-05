import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffff6e40),
          title: const Text('Tugas Pertemuan 4'),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 80,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Box 1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 185,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'Box 2',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 18),
                  Container(
                    width: 90,
                    height: 185,
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'Box 3',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
            ),
          ),
        );
  }
}
