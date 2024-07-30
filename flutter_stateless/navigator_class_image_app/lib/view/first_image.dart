import 'package:flutter/material.dart';

class FirstImage extends StatelessWidget {
  const FirstImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('First Image Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/pikachu-1.jpg',
              width: 250,
            ),
            ElevatedButton(
              // onPressed: () => Navigator.pop(context), // pop 2회?
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('Go to main'),
            ),
          ],
        ),
      ),
    );
  }
}