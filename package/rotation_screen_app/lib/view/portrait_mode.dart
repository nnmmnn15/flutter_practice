import 'package:flutter/material.dart';

class PortraitMode extends StatefulWidget {
  const PortraitMode({super.key});

  @override
  State<PortraitMode> createState() => _PortraitModeState();
}

class _PortraitModeState extends State<PortraitMode> {
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Center(
          child: Text('Portrait Mode'),
        ),
      ],
    );
  }
}
