import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class SwipePage extends StatefulWidget {
  const SwipePage({super.key});

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  // Property
  late List<String> imageName;
  late int currentImage;

  @override
  void initState() {
    super.initState();
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    currentImage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SimpleGestureDetector(
        onHorizontalSwipe: (direction) => _onHorizontalSwipe(direction),//좌우
        
        child: Center(
          child: Column(
            children: [
              Text(imageName[currentImage]),
              Image.asset(
                'images/${imageName[currentImage]}',
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onHorizontalSwipe(direction) {
    if (direction == SwipeDirection.left) {
      currentImage++;
      if (currentImage >= imageName.length) {
        currentImage = 0;
      }
    } else {
      currentImage--;
      if (currentImage < 0) {
        currentImage = imageName.length - 1;
      }
    }

    setState(() {});
  }

}
