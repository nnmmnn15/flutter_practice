import 'package:browser_action/view/first_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Main Page'),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const FirstPage());
                // Navigator.push(
                //   context, // FirstPage의 context
                //   MaterialPageRoute(
                //     builder: (context) {
                //       // FirstPage의 context가 두번째 page생성의 참조가 됨
                //       return const FirstPage();
                //     },
                //   ),
                // );
              },
              child: const Text('Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}
