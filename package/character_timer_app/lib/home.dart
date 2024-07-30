import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String currentText;
  late String allText;
  late int textIndex;

  late List charList;

  @override
  void initState() {
    super.initState();
    allText = '대한민국';
    textIndex = 0;

    currentText = '';
    charList = allText.split('');

    Timer.periodic(
      const Duration(seconds: 1),
      (timer) => changeText(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LED광고'),
      ),
      body: Center(
        child: Text(
          currentText,
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  changeText(){
    textIndex++;

    // if(textIndex > allText.length){
    //   textIndex = 1;
    // }
    // currentText = allText.substring(0, textIndex);

    if(textIndex >= charList.length){
      textIndex = 0;
      currentText = charList[textIndex];
    }else{
      currentText += charList[textIndex];
    }
    setState(() {});
  }

  
}