import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/model/lamp.dart';
import 'package:navigator_lamp_switch_app/view/modify_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String lampImagePath;
  late double rotate;
  late Timer rotateTimer;
  late bool timerAlive;

  @override
  void initState() {
    super.initState();
    rotate = 0;
    timerAlive = false;
    changeLamp();
    rotateImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ModifyPage(),
                )).then(
              (value) => changeLamp(),
            ),
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: Center(
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(rotate / 360),
          child: Image.asset(
            lampImagePath,
            width: 150,
          ),
        ),
      ),
    );
  }

  changeLamp() {
    if (timerAlive) {
      rotateTimer.cancel();
      timerAlive = false;
    }
    if (Lamp.rotate) {
      rotateTimer = Timer.periodic(
        Duration(milliseconds: Lamp.timer),
        (timer) {
          if (Lamp.rotate) {
            rotate++;
            setState(() {});
          }
        },
      );
      timerAlive = true;
    }
    if (Lamp.lampLight) {
      if (Lamp.lampColor) {
        lampImagePath = 'images/lamp_on.png';
      } else {
        lampImagePath = 'images/lamp_red.png';
      }
    } else {
      lampImagePath = 'images/lamp_off.png';
    }
    setState(() {});
  }

  rotateImage() {
    Timer.periodic(
      Duration(milliseconds: Lamp.timer),
      (timer) {
        if (Lamp.rotate) {
          rotate++;
          setState(() {});
        } else {
          timer.cancel();
        }
      },
    );
  }
}
