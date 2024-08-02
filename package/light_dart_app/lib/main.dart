import 'package:flutter/material.dart';
import 'package:light_dart_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system; // 기기의 초기값

  _changeThemeMode(ThemeMode themeMode){
    _themeMode = themeMode;
    setState(() {});
  }

  static const seedColor = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: _themeMode,
      darkTheme: ThemeData( // dark mode
        brightness: Brightness.dark,
        useMaterial3: true,
        colorSchemeSeed: seedColor,
      ),
      
      theme: ThemeData( // light mode
        brightness: Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: seedColor,
      ),
      home: Home(onChangeTheme: _changeThemeMode),
    );
  }
}