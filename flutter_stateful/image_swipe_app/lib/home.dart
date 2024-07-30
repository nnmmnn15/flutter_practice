import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      appBar: AppBar(
        title: const Text('Image Swiping'),
      ),
      body: SimpleGestureDetector(
        onHorizontalSwipe: (direction) => _onHorizontalSwipe(direction),//좌우
        onVerticalSwipe: (direction) => _onVerticalSwipe(direction), //상하
        onDoubleTap: () => _onDoubleTap(),
        onLongPress: () => _onLongPress(),
        
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

  _onVerticalSwipe(direction){
    if(direction == SwipeDirection.up){
      currentImage++;
      if(currentImage >= imageName.length){
        currentImage = 0;
      }
    }else{
      currentImage--;
      if(currentImage < 0){
        currentImage = imageName.length - 1;
      }
    }
    setState(() {});
  }

  _onDoubleTap(){
    currentImage++;
    if(currentImage >= imageName.length){
      currentImage = 0;
    }
    setState(() {});
  }

  _onLongPress(){
    currentImage--;
    if(currentImage < 0){
      currentImage = imageName.length - 1;
    }
    setState(() {});
  }
}
