import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/view/add_view.dart';
import 'package:listview_todo_ex_app/view/detail_view.dart';
import 'package:listview_todo_ex_app/view/main_view.dart';

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
        '/' : (context) => const MainView(),
        '/add' : (context) => const AddView(),
        '/detail' : (context) => const DetailView(),
      },
      initialRoute: '/',
    );
  }
}