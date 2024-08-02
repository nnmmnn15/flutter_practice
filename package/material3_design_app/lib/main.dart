import 'package:flutter/material.dart';
import 'package:material3_design_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const seedColor = Color.fromARGB(255, 81, 112, 235);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 81, 112, 235)),
        colorSchemeSeed: seedColor,
        brightness: Brightness.dark, // light
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
