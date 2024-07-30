import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text("Image Test"),
        centerTitle: false,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/smile.png',
                width: 200,
              ),
              Image.asset(
                'images/smile.png',
                width: 200,
              ),
              Image.asset(
                'images/smile.png',
                width: 200,
              ),
              Image.asset(
                'images/smile.png',
                width: 200,
              ),
              Image.asset(
                'images/smile.png',
                width: 200,
              ),
              Image.asset(
                'images/smile.png',
                width: 200,
              ),
              Image.asset(
                'images/smile.png',
                width: 200,
              ),
              Image.asset(
                'images/smile.png',
                width: 200,
              ),
              Image.asset(
                'images/smile.png',
                width: 200,
              ),
              Image.asset(
                'images/smile.png',
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}