import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Row 1'),
                SizedBox(height: 20),
                Text('Row 2'),
                SizedBox(height: 20),
                Text('Row 3'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}