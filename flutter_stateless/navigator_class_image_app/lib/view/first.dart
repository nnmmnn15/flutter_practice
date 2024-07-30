import 'package:flutter/material.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Screen 1st'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Screen 1st'),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/1st_image'),
              child: const Text('First Image'),
            ),
          ],
        ),
      ),
    );
  }
}