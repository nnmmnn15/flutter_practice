import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listview_insert_app/model/animal.dart';

class SecondPage extends StatefulWidget {
  final List<Animal> list;
  const SecondPage({super.key, required this.list});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // property
  late TextEditingController nameController; // TextField
  late int radioValue; // Radio Button
  late bool flyExist; // Check Box
  late String imagePath; // Image 선택
  late String imageName; // 선택한 Image 이름

  late List<String> imagePathList;
  late List<String> imageNameList;
  late List<Color> selectColor;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    radioValue = 0;
    flyExist = false;
    imagePath = "";
    imageName = "";
    imagePathList = [
      'images/bee.png',
      'images/cat.png',
      'images/cow.png',
      'images/dog.png',
      'images/fox.png',
      'images/monkey.png',
      'images/pig.png',
      'images/wolf.png',
    ];
    imageNameList = [
      '벌',
      '고양이',
      '젖소',
      '강아지',
      '여우',
      '원숭이',
      '돼지',
      '늑대',
    ];
    selectColor = [
      Colors.yellow,
      Colors.yellow,
      Colors.yellow,
      Colors.yellow,
      Colors.yellow,
      Colors.yellow,
      Colors.yellow,
      Colors.yellow,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                ),
                keyboardType: TextInputType.text,
                maxLength: 10,
                maxLines: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  fillColor: WidgetStatePropertyAll(Colors.deepPurple),
                  value: 0,
                  groupValue: radioValue,
                  onChanged: (value) => radioChange(value),
                ),
                const Text('양서류'),
                Radio(
                  value: 1,
                  groupValue: radioValue,
                  onChanged: (value) => radioChange(value),
                ),
                const Text('파충류'),
                Radio(
                  value: 2,
                  groupValue: radioValue,
                  onChanged: (value) => radioChange(value),
                ),
                const Text('포유류'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('날 수 있나요?'),
                Checkbox(
                  value: flyExist,
                  onChanged: (value) {
                    flyExist = value!;
                    setState(() {});
                  },
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imagePathList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      imagePath = imagePathList[index];
                      imageName = imageNameList[index];
                      selectedColor(index);
                      setState(() {});
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: selectColor[index], width: 2)),
                      child: Image.asset(
                        imagePathList[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(imageName),
            ),
            ElevatedButton(
              onPressed: () => _showDialog(),
              child: const Text('동물 추가하기'),
            ),
          ],
        ),
      ),
    );
  }

  // --- Function ---
  radioChange(int? value) {
    radioValue = value!;
    setState(() {});
  }

  _showDialog() {
    var animal = Animal(
      imagePath: imagePath,
      animalName: nameController.text,
      kind: getKind(radioValue),
      flyExist: flyExist,
    );

    Get.defaultDialog(
        title: '동물 추가하기',
        middleText: '이 동물은 ${animal.animalName} 입니다.\n'
            '또 이 동물의 종류는 ${animal.kind} 입니다\n'
            '이 동물은 ${animal.flyExist ? "날 수 있습니다." : "날 수 없습니다."}\n'
            '이 동물을 추가하시겠습니까?',
        barrierDismissible: false,
        titleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        actions: [
          TextButton(
            onPressed: () {
              widget.list.add(animal);
              Get.back();
            },
            child: const Text('예'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('아니오'),
          ),
        ]);
  }

  getKind(int radioValue) {
    String returnValue = "";

    switch (radioValue) {
      case 0:
        returnValue = "양서류";
      case 1:
        returnValue = "파충류";
      case 2:
        returnValue = "포유류";
    }
    return returnValue;
  }

  selectedColor(index) {
    for (int i = 0; i < selectColor.length; i++) {
      selectColor[i] = Colors.yellow;
    }
    selectColor[index] = Colors.red;
  }
}
