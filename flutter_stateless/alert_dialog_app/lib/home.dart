import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog with Gesture'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),// _로 시작하는 변수는 private 변수 클래스 내부에서만 사용가능한 변수
          child: const Text(
            'Hello World!'
          ),
        ),
      ),
    );
  }

  // --- Function ----
  _showDialog(context){
    showDialog(
      context: context,
      barrierColor: const Color.fromARGB(71, 244, 67, 54), // dialog 외부(barrier)의 색상
      barrierDismissible: false,  // barrier를 누를때 종료되는 것을 방지
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.amber[100],
          title: const Text('Alert title'),
          content: const Text('Hello World를\nTouch했습니다.'),
          actions: [
            Center(
              child: TextButton(
                // onPressed: () => Navigator.pop(context),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('종료'),
              ),
            )
          ],
        );
      },
    );
  }
}