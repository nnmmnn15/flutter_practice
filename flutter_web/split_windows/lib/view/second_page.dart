import 'package:flutter/material.dart';
import 'package:flutter_split_view/flutter_split_view.dart';
import 'package:split_windows/view/third_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                SplitView.of(context).pop();
              },
              child: const Text('Back'),
            ),
            ElevatedButton(
              onPressed: () {
                SplitView.of(context).push(const ThirdPage(), title: 'Third');
                // SplitView.of(context)
                //     .setSecondary(const ThirdPage(), title: 'Third');
              },
              child: const Text('forward'),
            ),
          ],
        ),
      ),
    );
  }
}
