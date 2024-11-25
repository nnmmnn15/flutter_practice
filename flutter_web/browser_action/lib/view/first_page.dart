import 'package:browser_action/view/second_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('First Page'),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const SecondPage(),
                );
                // Navigator.push(
                //   context, // FirstPage의 context
                //   MaterialPageRoute(
                //     builder: (context) {
                //       // FirstPage의 context가 두번째 page생성의 참조가 됨
                //       return const SecondPage();
                //     },
                //   ),
                // );
              },
              child: const Text('Second Page'),
            ),
          ],
        ),
      ),
    );
  }
}
