import 'dart:async';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  // Property
  late List<String> imageFile;
  late int curruntPage;
  late bool isRunning;

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
    isRunning = true;

    curruntPage = 0;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(!isRunning){
        timer.cancel();
      }
      changeImage();
    });
  }

  @override
  void dispose() {
    isRunning = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    if(isRunning){
      setState(() {});
    }
  }
}