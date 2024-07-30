import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
      appBar: AppBar(
        title: const Text('무한이미지 반복'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              imageFile[currentPage],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            Stack(
              children:[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 10,
                    ),
                  ),
                  child: Image.asset(
                  'images/${imageFile[currentPage]}',
                  ),
                ),

                Positioned(
                  left: 275,
                  top: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.amber,
                        width: 5,
                      )
                    ),
                    child: Image.asset(
                    'images/${imageFile[nextPage]}',
                    width: 100,
                    height: 140,
                    ),
                  ),
                ),
                
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                        width: 5,
                      )
                    ),
                    width: 100,
                    height: 140,
                    child: Image.asset(
                      'images/${imageFile[prevPage]}'
                    ),
                  ),
                )
              ]
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