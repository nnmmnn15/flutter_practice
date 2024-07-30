import 'package:flutter/material.dart';

class SendMail extends StatelessWidget {
  const SendMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Mail'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('유비에게 보낸 메일'),
            const Text('관우에게 보낸 메일'),
            const Text('장비에게 보낸 메일'),
            Image.asset('images/pikachu-1.jpg'),
          ],
        ),
      ),
    );
  }
}