import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Property
  late String _lampImage;   // Image File Name
  late double _lampWidth;   // Image Width
  late double _lampHeight;  // Image Heigh
  late String _buttonName;  // Button Title
  late bool _switch;        // Switch 켜짐 상태
  late bool _lampSizeStatus;// 현재 Lamp 크기

  late double rotate;
  late bool _rotateState;
  late String _rotateName;

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _buttonName = "Image 확대";
    _switch = true;
    _lampSizeStatus = false;

    rotate = 0;
    _rotateState = false;
    _rotateName = '회전 켜기';

    Timer.periodic(
      const Duration(milliseconds: 10),
      (timer) => rotateImage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image확대 및 축소'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 330,
              height: 630,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RotationTransition(
                    turns: AlwaysStoppedAnimation(rotate/360),
                    child: Image.asset(
                      _lampImage,
                      width: _lampWidth,
                      height: _lampHeight,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => decisionLampSize(),
                  child: Text(_buttonName),
                ),
                Column(
                  children: [
                    const Text(
                      '전구 스위치',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    Switch(
                      value: _switch,
                      onChanged: (value) {
                        _switch = value;
                        decisionOnOff();
                      },
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () => rotateOnOff(),
                  child: Text(_rotateName),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // --- Function ---
  decisionOnOff(){
    if(_switch){
      _lampImage = 'images/lamp_on.png';
    }
    else{
      _lampImage = 'images/lamp_off.png';
    }
    setState(() {});
  }

  decisionLampSize(){
    if(_lampSizeStatus){
      _lampWidth = 150;
      _lampHeight = 300;
      _buttonName = 'Image 확대';
      _lampSizeStatus = false;
    }else{
      _lampWidth = 300;
      _lampHeight = 600;
      _buttonName = 'Image 확대';
      _lampSizeStatus = true;
    }
    setState(() {});
  }

  rotateOnOff(){
    if(_rotateState){
      _rotateName = '회전 켜기';
      _rotateState = false;
    }else{
      _rotateName = '회전 끄기';
      _rotateState = true;
    }
  }

  rotateImage(){
    if(_rotateState){
      rotate++;
      setState(() {});
    }
  }
}