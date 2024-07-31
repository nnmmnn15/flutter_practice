import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  // Property
  late List<String> imageFile;
  late int currentPage;
  late int nextPage;
  late int prevPage;

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
    currentPage = 0;
    nextPage = 1;
    prevPage = imageFile.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              imageFile[currentPage],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              width: 300,
              child: Image.asset(
              'images/${imageFile[currentPage]}',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => prevButton(),
                  child: const Text('<< 이전'),
                ),
                ElevatedButton(
                  onPressed: () => nextButton(),
                  child: const Text('다음 >>'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  prevButton(){
    currentPage--;
    if(currentPage < 0){
      currentPage = imageFile.length - 1;
    }
    nextPage--;
    if(nextPage < 0){
      nextPage = imageFile.length - 1;
    }
    prevPage--;
    if(prevPage < 0){
      prevPage = imageFile.length - 1;
    }
    setState(() {});
  }

  nextButton(){
    currentPage++;
    if(currentPage >= imageFile.length){
      currentPage = 0;
    }
    nextPage++;
    if(nextPage >= imageFile.length){
      nextPage = 0;
    }
    prevPage++;
    if(prevPage >= imageFile.length){
      prevPage = 0;
    }
    setState(() {});
  }
}