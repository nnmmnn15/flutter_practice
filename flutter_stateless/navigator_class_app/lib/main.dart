import 'package:flutter/material.dart';
import 'package:navigator_class_app/view/first_page.dart';
import 'package:navigator_class_app/view/home.dart';
import 'package:navigator_class_app/view/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // routing table 
      // Aliasing : 별칭
      // 별칭을 사용하면 작동
      routes: {
        '/' : (context) => const Home(),
        '/1st' : (context) => const FirstPage(),
        '/2nd' : (context) => const SecondPage(),
      },
      // route 의 초기값 설정 '/' : (context) => const Home(), 이기 때문에 Home()으로 이동
      initialRoute: '/',
    );
  }
}