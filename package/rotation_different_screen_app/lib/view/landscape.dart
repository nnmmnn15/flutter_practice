import 'package:flutter/material.dart';

class Landscape extends StatefulWidget {
  const Landscape({super.key});

  @override
  State<Landscape> createState() => _LandscapeState();
}

class _LandscapeState extends State<Landscape> {
  // Property
  late bool switchState;

  @override
  void initState() {
    super.initState();
    switchState = false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  switchState = !switchState;
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: switchState ? Colors.red : Colors.blue
                ),
                child: const Text(
                  'Flutter',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Switch(
                value: switchState,
                onChanged: (value) {
                  switchState = value;
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
