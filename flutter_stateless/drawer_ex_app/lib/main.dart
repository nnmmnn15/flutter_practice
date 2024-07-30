import 'package:drawer_ex_app/view/home.dart';
import 'package:drawer_ex_app/view/received_mail.dart';
import 'package:drawer_ex_app/view/send_mail.dart';
import 'package:flutter/material.dart';

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
      routes: {
        '/' : (context) => const Home(),
        '/send' : (context) => const SendMail(),
        '/received' : (context) => const ReceivedMail(),
      },
      initialRoute: '/',
    );
  }
}