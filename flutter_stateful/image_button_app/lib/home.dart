import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late List<String> imageName;
  late int currentIndex;

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
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('무한 이미지 반복'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(imageName[currentIndex]),
            Image.asset(
              'images/${imageName[currentIndex]}'
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => previousImage(),
                  child: const Text('<< 이전'),
                ),
                ElevatedButton(
                  onPressed: () => nextImage(),
                  child: const Text('다음 >>'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  previousImage(){
    currentIndex--;
    if(currentIndex < 0){
      currentIndex = imageName.length -1;
    }
    setState(() {});
  }

  nextImage(){
    currentIndex++;
    if(currentIndex >= imageName.length){
      currentIndex = 0;
    }
    setState(() {});
  }

  
}