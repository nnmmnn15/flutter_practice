import 'package:flutter/material.dart';

class Portrait extends StatefulWidget {
  const Portrait({super.key});

  @override
  State<Portrait> createState() => _PortraitState();
}

class _PortraitState extends State<Portrait> {
  // Property
  late bool buttonState;

  @override
  void initState() {
    super.initState();
    buttonState = true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              buttonState = !buttonState;
              setState(() {});
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonState ? Colors.blue : Colors.red,
            ),
            child: Text(
              buttonState ? "Hello" : "Flutter",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
