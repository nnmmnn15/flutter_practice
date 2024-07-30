import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late TextEditingController advertisementController;
  // late String advertisementText;  // 전체 문구
  late String currentText;        // 현재 문구
  late int currentIndex;          // 현재 문구 index
  late List<String> advTextList;  // 전체 문구 char리스트

  @override
  void initState() {
    super.initState();

    advertisementController = TextEditingController();
    // advertisementText = '';
    advTextList = advertisementController.text.split('');
    // advTextList = advertisementText.split('');

    currentIndex = 0;
    currentText = '';

    Timer.periodic(
      const Duration(seconds: 1),
      (timer) => textUpdate(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LED 광고'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Center(
                child: Text(
                  '광고 문구를 입력하세요.',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 15, 20),
              child: TextField(
                controller: advertisementController,
                decoration: const InputDecoration(
                  labelText: '글자를 입력하세요',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 10, 70, 10),
              child: ElevatedButton(
                onPressed: () => updateAdvertisement(),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                child: const Text(
                  '광고문구 생성',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          currentText,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }


  textUpdate(){
    
    if(advTextList.isNotEmpty){
      if(currentIndex >= advTextList.length){
        currentIndex = 0;
        currentText = advTextList[currentIndex];
      }else{
        currentText += advTextList[currentIndex];
      }
    }
    currentIndex++;
    setState(() {});
  }

  updateAdvertisement(){
    // advertisementText = advertisementController.text;
    // advTextList = advertisementText.split('');
    Navigator.pop(context);
    advTextList = advertisementController.text.split('');
    
    currentText = '';
    currentIndex = 0;

    setState(() {});
  }
}