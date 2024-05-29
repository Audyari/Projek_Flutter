import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Click Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ClickGamePage(key: ValueKey('ClickGamePage')),
    );
  }
}

class ClickGamePage extends StatefulWidget {
  const ClickGamePage({super.key});

  @override
  ClickGamePageState createState() => ClickGamePageState();
}

class ClickGamePageState extends State<ClickGamePage> {
  final Random random = Random();
  int score = 0;
  double x = 0.5;
  double y = 0.5;

  void moveCircle() {
    double newX = random.nextDouble() * (1 - 0.1) + 0.05;
    double newY = random.nextDouble() * (1 - 0.1) + 0.05;

    setState(() {
      x = newX;
      y = newY;
    });

    // Pastikan lingkaran berada di dalam layar dengan diameter penuh
    double circleRadius = 25;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double newX2 = (circleRadius / screenWidth) + (1 - (2 * circleRadius / screenWidth)) * newX;
    double newY2 = (circleRadius / screenHeight) + (1 - (2 * circleRadius / screenHeight)) * newY;

    setState(() {
      x = newX2;
      y = newY2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Game Sederhana'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: x * MediaQuery.of(context).size.width - 25,
            top: y * MediaQuery.of(context).size.height - 25,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  score++;
                  moveCircle();
                });
              },
              child: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blue,
              ),
            ),
          ),
          Center(
            child: Text(
              'Score: $score',
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}