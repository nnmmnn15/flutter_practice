import 'package:flutter/material.dart';
import 'package:navigator_class_image_app/view/first.dart';
import 'package:navigator_class_image_app/view/first_image.dart';
import 'package:navigator_class_image_app/view/home.dart';
import 'package:navigator_class_image_app/view/second.dart';
import 'package:navigator_class_image_app/view/second_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/' : (context) => const Home(),
        '/1st' : (context) => const First(),
        '/2nd' : (context) => const Second(),
        '/1st_image' : (context) => const FirstImage(),
        '/2nd_image' : (context) => const SecondImage(),
      },
      initialRoute: '/',
    );
  }
}