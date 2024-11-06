import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Oswald',
      ),
      home: FirstScreen(),
    );
  }
}

class MyImage extends StatelessWidget {
  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 5'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Image.network(
          'data:image/jpeg;base64,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',
          width: 400,
          height: 400,
        ),
      ),
    );
  }
}

class MyImageAsset extends StatelessWidget {
  const MyImageAsset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 5'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Image.asset(
          'images/ulbi.jpg',
          width: 400,
          height: 400,
        ),
      ),
    );
  }
}

class MyCustomFont extends StatelessWidget {
  const MyCustomFont({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 5'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: const Center(
        child: Text(
          'Custom Font',
          style: TextStyle(
            fontFamily: 'Oswald',
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

class ScrollingScreen extends StatelessWidget {
  const ScrollingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '1',
                style: TextStyle(fontSize: 50,),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '2',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '3',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '4',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScrollingScreenList extends StatelessWidget {
  ScrollingScreenList({super.key});

  final List<int> numberList = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: numberList.map((number) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                '$number',
                style: const TextStyle(fontSize: 50),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ScrollingScreenListBuilder extends StatelessWidget {
  ScrollingScreenListBuilder({super.key});

  final List<int> numberList = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: numberList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                '${numberList[index]}',
                style: const TextStyle(fontSize: 50),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ScrollingScreenListSeparated extends StatelessWidget {
  ScrollingScreenListSeparated({super.key});

  final List<int> numberList = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: numberList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                '${numberList[index]}',
                style: const TextStyle(fontSize: 50),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  final String message = 'Hello from First Screen!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pindah Screen'),
          onPressed: () {
            Navigator.push(context, 
              MaterialPageRoute(builder: (context) => SecondScreen(message)));
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String message;

  const SecondScreen(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            OutlinedButton(
              child: const Text('Kembali'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}