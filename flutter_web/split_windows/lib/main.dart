import 'package:flutter/material.dart';
import 'package:flutter_split_view/flutter_split_view.dart';
import 'package:split_windows/view/home.dart';
import 'package:split_windows/view/place_holder_page.dart';

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
      home: const SplitView.material(
        childWidth: 200, // Home Size
        placeholder: PlaceHolderPage(),
        child: Home(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
