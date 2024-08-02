import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/model/animal.dart';
import 'package:navigator_tabbar_ex_app/view/first_page.dart';
import 'package:navigator_tabbar_ex_app/view/second_page.dart';

class TabHome extends StatefulWidget {
  const TabHome({super.key});

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> with SingleTickerProviderStateMixin {
  // property
  late TabController controller;
  late List<Animal> animalList;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    animalList = [];
    addList();
  }

  addList() {
    List<String> imagePathList = [
      'images/bee.png',
      'images/cat.png',
      'images/cow.png',
      'images/dog.png',
      'images/fox.png',
      'images/monkey.png',
      'images/pig.png',
      'images/wolf.png',
    ];
    List<String> animalNameList = [
      '벌',
      '고양이',
      '젖소',
      '강아지',
      '여우',
      '원숭이',
      '돼지',
      '늑대',
    ];
    List<String> kindList = [
      '곤충',
      '포유류',
      '포유류',
      '포유류',
      '포유류',
      '영장류',
      '포유류',
      '포유류',
    ];
    List<bool> flyExistList = [
      true,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
    ];

    for (int i = 0; i < imagePathList.length; i++) {
      animalList.add(Animal(
        imagePath: imagePathList[i],
        animalName: animalNameList[i],
        kind: kindList[i],
        flyExist: flyExistList[i],
      ));
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Test'),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          FirstPage(list: animalList),
          SecondPage(list: animalList),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        tabs: const [
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.blue,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.blue,
            ),
          ),
        ]
      ),
    );
  }
}
