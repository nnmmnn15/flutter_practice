import 'package:flutter/material.dart';

class Home1 extends StatelessWidget {
  const Home1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Exercise 01'),
      ),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('유비'),
            
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text('관우'),
            ),
            
            Text('장비'),
          ],
        ),
      ),
    );
  }
}
