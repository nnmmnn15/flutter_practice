import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Image Padding'),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/pikachu-1.jpg',
              width: 150,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
              child: Image.asset(
                'images/pikachu-2.jpg',
                width: 150,
              ),
            ),
            Image.asset(
              'images/pikachu-3.jpg',
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}