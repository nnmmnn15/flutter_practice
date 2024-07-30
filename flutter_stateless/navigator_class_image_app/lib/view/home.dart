import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/1st'),
              child: const Text('Go to the Screen #1'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/2nd'),
              child: const Text('Go to the Screen #2'),
            ),
          ],
        ),
      ),
    );
  }
}