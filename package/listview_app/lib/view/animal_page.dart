import 'package:flutter/material.dart';
import 'package:listview_app/model/animal.dart';

class AnimalPage extends StatefulWidget {
  const AnimalPage({super.key});

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {

  late List<Animal> animalList;

  @override
  void initState() {
    super.initState();
    animalList = [];
    addData();
  }

  addData(){
    animalList.add(Animal(animalName: '벌', imagePath: 'images/bee.png', species: '파충류', flyAble: '날수 있습니다', fly: true));
    animalList.add(Animal(animalName: '고양이', imagePath: 'images/cat.png', species: '포유류', flyAble: '날수 없습니다', fly: false));
    animalList.add(Animal(animalName: '염소', imagePath: 'images/cow.png', species: '포유류', flyAble: '날수 없습니다', fly: false));
    animalList.add(Animal(animalName: '강아지', imagePath: 'images/dog.png', species: '포유류', flyAble: '날수 없습니다', fly: false));
    animalList.add(Animal(animalName: '여우', imagePath: 'images/fox.png', species: '포유류', flyAble: '날수 없습니다', fly: false));
    animalList.add(Animal(animalName: '원숭이', imagePath: 'images/monkey.png', species: '영장류', flyAble: '날수 없습니다', fly: false));
    animalList.add(Animal(animalName: '돼지', imagePath: 'images/pig.png', species: '포유류', flyAble: '날수 없습니다', fly: false));
    animalList.add(Animal(animalName: '늑대', imagePath: 'images/wolf.png', species: '포유류', flyAble: '날수 없습니다', fly: false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview Test'),
      ),
      body: ListView.builder(
        itemCount: animalList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _showDialog(context, index),
            child: SizedBox(
              height: 150,
              child: Card(
                color: Colors.white,
                child: Row(
                  children: [
                    Image.asset(
                      animalList[index].imagePath,
                      height: 100,
                    ),
                    Text(
                      '   ${animalList[index].animalName}',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  _showDialog(context, int index){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(animalList[index].animalName),
          content: Text(
            '이 동물은 ${animalList[index].species} 입니다.\n이 동물은 ${animalList[index].flyAble}'
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                '종료',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}