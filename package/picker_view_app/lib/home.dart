import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List<String> imageName;
  late int selectedItem;

  @override
  void initState() {
    super.initState();
    imageName = [
      'w1.jpg',
      'w2.jpg',
      'w3.jpg',
      'w4.jpg',
      'w5.jpg',
      'w6.jpg',
      'w7.jpg',
      'w8.jpg',
      'w9.jpg',
      'w10.jpg',
    ];
    selectedItem = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picker View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Picker View로 이미지 선택',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 300,
              height: 250,
              child: CupertinoPicker(
                backgroundColor: const Color.fromARGB(48, 255, 193, 7),
                itemExtent: 50, // 아이템의 사이즈
                scrollController: FixedExtentScrollController(initialItem: 0),
                onSelectedItemChanged: (value) {
                  selectedItem = value;
                  setState(() {});
                },
                children: List.generate(
                  imageName.length,
                  (index) => Center(
                    child: Image.asset(
                      'images/${imageName[index]}',
                      width: 50,
                    ),
                  ),
                ),
              ),
            ),
            Text('selected Item : ${imageName[selectedItem]}'),
            SizedBox(
              width: 300,
              height: 200,
              child: Image.asset(
                'images/${imageName[selectedItem]}',
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
