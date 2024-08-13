import 'package:collection_view_image_app/view/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List<String> imageNameList;

  @override
  void initState() {
    super.initState();
    imageNameList = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flower Garden'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: imageNameList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.to(
                const Detail(),
                arguments: imageNameList[index],
              ),
              child: Card(
                color: Colors.green[50],
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'images/${imageNameList[index]}',
                            height: 150,
                          ),
                        ),
                        const RotationTransition(
                          turns: AlwaysStoppedAnimation(315 / 360),
                          alignment: Alignment.center,
                          child: Text(
                            'All right rescived!',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 17, 0),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(imageNameList[index])
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
