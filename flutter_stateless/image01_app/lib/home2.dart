import 'package:flutter/material.dart';

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        title: const Text("Image 01"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(
                'images/pikachu-1.jpg'
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(
                  'images/pikachu-2.jpg'
                ),
              ),
            ),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(
                'images/pikachu-3.jpg'
              ),
            ),
          ],
        ),
      ),
    );
  }
}