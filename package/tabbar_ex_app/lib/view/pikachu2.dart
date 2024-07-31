import 'package:flutter/material.dart';

class Pikachu2 extends StatelessWidget {
  const Pikachu2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/pikachu-1.jpg'),
              radius: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
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
          ],
        ),
      ),
    );
  }
}
