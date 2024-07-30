import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  // Property
  late bool buttonState;
  late String buttonText;
  late Color buttonColor;

  @override
  void initState() {
    super.initState();
    buttonText = 'Hello';
    buttonColor = Colors.blue;
    buttonState = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change button color & text'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                buttonState = !buttonState;
                buttonPress();
                // buttonPress1(buttonState); // => 가능하도록 만들어봄
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
              ),
              child: Text(buttonText),
            ),
            Switch(
              value: buttonState,
              onChanged: (value) {
                buttonState = value;
                buttonPress();
              },
            ),
          ],
        ),
      ),
    );
  }

  buttonPress(){
    if(buttonState){
      buttonColor = Colors.amber;
      buttonText = 'Hello'; 
    } else{
      buttonColor = Colors.blue;
      buttonText = 'Flutter';
    }
    // buttonState = !buttonState;
    setState(() {});
  }

  buttonPress1(state){
    buttonState = !state;
    if(buttonState){
      buttonColor = Colors.amber;
      buttonText = 'Hello'; 
    } else{
      buttonColor = Colors.blue;
      buttonText = 'Flutter';
    }
    // buttonState = !buttonState;
    setState(() {});
  }
}