import 'package:flutter/material.dart';
import 'package:rotation_screen_app/view/landscape_mode.dart';
import 'package:rotation_screen_app/view/portrait_mode.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotation Screen'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if(orientation == Orientation.portrait){
            return const PortraitMode();
          } else {
            return const LandscapeMode();
          }
        },
      ),
    );
  }
}
