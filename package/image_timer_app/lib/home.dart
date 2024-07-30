import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Property
  late List<String> imageFile;
  late int curruntPage;

  @override
  void initState() {
    super.initState();
    imageFile = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];

    curruntPage = 0;

    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        changeImage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3초마다 이미지 무한 반복'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              imageFile[curruntPage],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Image.asset(
              'images/${imageFile[curruntPage]}',
              width: 370,
            ),



            // ElevatedButton(
            //   onPressed: () => changeImage(),
            //   child: const Text('다음'),
            // ),




          ],
        ),
      ),
    );
  }

  // --- Function ---
  changeImage() {
    curruntPage++;
    if(curruntPage >= imageFile.length){
      curruntPage = 0;
    }
    setState(() {});
  }
}