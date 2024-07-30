import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator_AppBar'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/send'),
            icon: const Icon(Icons.email),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/received'),
            icon: const Icon(Icons.email_outlined),
          ),
        ],
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/send'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
              child: const Text('보낸 편지함'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/received'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
              child: const Text('받은 편지함'),
            ),
            GestureDetector(
              child: Image.asset(
                'images/pikachu-1.jpg',
                width: 150,
              ),
              onTap: () => Navigator.pushNamed(context, '/send'),
            )
          ],
        ),
      ),
    );
  }
}