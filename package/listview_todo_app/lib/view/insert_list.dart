import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  //Property
  late TextEditingController textEditingController;
  late List<String> imagePath;
  late int selectedImage;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    selectedImage = 0;
    imagePath = [
      'cart.png',
      'clock.png',
      'pencil.png',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('images/${imagePath[selectedImage]}'),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CupertinoPicker(
                    backgroundColor: Color.fromARGB(58, 104, 58, 183),
                    looping: true,
                    itemExtent: 50,
                    onSelectedItemChanged: (value) {
                      selectedImage = value;
                      setState(() {});
                    },
                    children: List.generate(
                      imagePath.length,
                      (index) => Center(child: Image.asset('images/${imagePath[index]}'),),
                    ),
                  ),
                )
              ],
            ),
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                labelText: '목록을 입력하세요',
              ),
              keyboardType: TextInputType.text,
            ),
            ElevatedButton(
              onPressed: () {
                if (textEditingController.text.trim().isNotEmpty) {
                  addList();
                }
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }

  // --- Function ---
  addList() {
    Message.imagePath = 'images/pencil.png';
    Message.workList = textEditingController.text.trim();
    Message.action = true;
  }
}
