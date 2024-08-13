import 'package:flutter/material.dart';

class LandscapeMode extends StatefulWidget {
  const LandscapeMode({super.key});

  @override
  State<LandscapeMode> createState() => _LandscapeModeState();
}

class _LandscapeModeState extends State<LandscapeMode> {
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Center(
          child: Text('Landscape Mode'),
        ),
      ],
    );
  }
}
