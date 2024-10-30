import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tempat Wisata di Bandung',
      theme: ThemeData(),
      home: const DetailScreen(),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: const Text(
              'Ranca Upas',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(Icons.calendar_today),
                    SizedBox(height: 8.0),
                    Text('Open Everyday'),
                  ],
                ),

                Column(
                  children: <Widget>[
                    Icon(Icons.access_time),
                    SizedBox(height: 8.0),
                    Text('09:00 - 20:00'),
                  ],
                ),

                Column(
                  children: <Widget>[
                    Icon(Icons.monetization_on),
                    SizedBox(height: 8.0),
                    Text('Rp 20.000'),
                  ],
                ),
              ],
            ),
          ),

        Container(
          margin: const EdgeInsets.all(16.0),
          child: const Text(
            'Ranca Upas adalah area wisata alam di Ciwidey, Bandung, terkenal dengan perkemahan, pemandangan pegunungan, dan udara sejuk. Daya tarik utamanya adalah penangkaran rusa, di mana pengunjung bisa memberi makan dan berinteraksi dengan rusa-rusa jinak. Selain berkemah, pengunjung bisa menikmati aktivitas lain seperti trekking, berendam di kolam air panas, dan outbond. Ranca Upas cocok untuk wisata keluarga yang ingin menikmati suasana alam dan udara segar.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        ],
        ), 

      ),
    );
  }
}