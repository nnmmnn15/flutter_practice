import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert and push'),
        backgroundColor: Colors.red[400],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text('2번째 페이지 입니다.'),
      ),
    );
  }
}