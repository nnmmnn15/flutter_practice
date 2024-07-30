import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('삼국지'),
        backgroundColor: const Color.fromARGB(255, 36, 222, 27),
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: const Center( // 중앙 정렬 x,y 축
        child: Column( // Center의 영향을 column(y축으로 쌓음)이 받음 = 위에서 부터 쌓임
          mainAxisAlignment: MainAxisAlignment.center, // column을 중앙 정렬
          children: [
            Text('body1'),
            Text('body2'),
            Text('body3'),
            SizedBox(
              height: 50,
            ),
            Text('body4'),
            Text('body5'),
            Text('body6'),
          ],
        )
      ),
    );
  }
}
