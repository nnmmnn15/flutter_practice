import 'package:flutter/material.dart';

class PlaceHolderPage extends StatelessWidget {
  const PlaceHolderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Click the button in main view to push here.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
