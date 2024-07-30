import 'package:flutter/material.dart';
import 'package:navigator_app/view/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => goSecondPage(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
          child: const Text(
            'Go to the second page'
          )
        ),
      ),
    );
  }
  // --- Function ----
  goSecondPage(context) {
    Navigator.push(
      context, // FirstPage의 context
      MaterialPageRoute(builder: (context) { // FirstPage의 context가 두번째 page생성의 참조가 됨
        return const SecondPage();
      },),
    );
  }

}
