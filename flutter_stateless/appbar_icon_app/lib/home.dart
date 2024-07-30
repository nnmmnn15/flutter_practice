import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        // toolbarOpacity: 1.0, // 투명도
        toolbarHeight: 100,
        backgroundColor: Colors.lightGreen,
        title: Column(
          children: [
            const Text('App Bar Icon'),
            const Text('App Bar Icon'),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            //
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(Icons.email),
          ),
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(Icons.add_alarm),
          ),
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(Icons.add_outlined),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                print('>>>>>>');
              },
              child: Image.asset(
                'images/smile.png',
                width: 30,
                height: 50,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}