import 'package:flutter/material.dart';

class Pikachu1 extends StatelessWidget {
  const Pikachu1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-1.jpg'),
                radius: 70,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-2.jpg'),
                radius: 70,
              ),
            ),
            CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-3.jpg'),
                radius: 70,
            ),
          ],
        ),
      ),
    );
  }
}