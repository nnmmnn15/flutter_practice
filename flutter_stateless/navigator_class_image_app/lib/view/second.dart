import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Screen 2nd'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Screen 2nd'),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/2nd_image'),
              child: const Text('Second Image'),
            ),
          ],
        ),
      ),
    );
  }
}