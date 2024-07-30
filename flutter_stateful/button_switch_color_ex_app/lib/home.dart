import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // property
  late Color buttonColor;
  late bool switchValue;

  @override
  void initState() {
    super.initState();
    buttonColor = Colors.blue;
    switchValue = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Changed Button color on Switch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => changeSwitch(),
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white
              ),
              child: const Text('Flutter'),
            ),
            Switch(
              value: switchValue,
              onChanged: (value) {
                switchValue = value;
                changeButtonColor();
              },
            ),
          ],
        ),
      ),
    );
  }

  // --- Function ----
  changeSwitch() {
    switchValue = switchValue ? false : true;
    changeButtonColor();
  }

  changeButtonColor(){
    buttonColor = switchValue ? Colors.red : Colors.blue;
    setState(() {});
  }
}