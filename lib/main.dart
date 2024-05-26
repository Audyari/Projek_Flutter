import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _count = 0;
  double _fontSize = 48.0;

  void _onPressed() {
    setState(() {
      _count++;
      _fontSize += 4.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Stateful',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Belajar Stateful')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$_count',
                style: TextStyle(
                  fontSize: _fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _onPressed,
                child: const Text('Tambah Bilangan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}