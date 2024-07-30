import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        title: const Text('Image 01'),
      ),
      body: Center(
        child: CircleAvatar(
          backgroundImage: AssetImage(
            'images/pikachu-1.jpg',
          ),
          radius: 70,
        )
      ),
    );
  }
}