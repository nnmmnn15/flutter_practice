import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('James'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Kenny1'),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Kenny2'),
                ),
                Text('Kenny3'),
              ],
            ),
            Text('Cathy'),
          ],
        ),
      ),
    );
  }
}