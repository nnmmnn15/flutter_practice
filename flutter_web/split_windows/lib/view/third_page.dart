import 'package:flutter/material.dart';
import 'package:flutter_split_view/flutter_split_view.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            SplitView.of(context).pop();
          },
          child: const Text('back'),
        ),
      ),
    );
  }
}
