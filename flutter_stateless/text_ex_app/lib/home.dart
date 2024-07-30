import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Exercise 01'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '유비',
              style: TextStyle(color: Colors.cyan),
            ),
            Text('관우'),
            Text('장비'),
            Divider(
              height: 30, // 선과 글 사이의 간격
              color: Colors.red,
              thickness: 2, // 선 굵기
            ),
            // SizedBox(
            //   height: 30,
            // ),
            Text(
              '조조',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 28, // 크기
                fontWeight: FontWeight.bold, // 두께
                letterSpacing: 5, // 글자 간격
              ),
            ),
            Text('여포'),
            Text('동탁'),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('위'),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Text('촉'),
                  ),
                  Text('오'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
