import 'package:flutter/material.dart';
import 'package:tabbar_app/view/two.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => goSecondPage(context),
          child: const Text('2-2'),
        ),
      ),
    );
  }
  goSecondPage(context) {
  Navigator.push(
    context, // FirstPage의 context
    MaterialPageRoute(builder: (context) { // FirstPage의 context가 두번째 page생성의 참조가 됨
      return const Two();
    },),
  );
}
}