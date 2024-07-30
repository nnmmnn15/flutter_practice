import 'package:flutter/material.dart';

class ReceivedMail extends StatelessWidget {
  const ReceivedMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Received Mail'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(15, 30, 0, 0),
        child: Column(
          children: [
            Text('유비에게 온 메일'),
            Text('관우에게 온 메일'),
            Text('장비에게 온 메일'),
          ],
        ),
      ),
    );
  }
}