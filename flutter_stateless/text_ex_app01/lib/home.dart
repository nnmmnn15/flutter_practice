import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Exercise 01a'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('유비'),
            
            Padding(
              padding: EdgeInsets.all(50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('조조'),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Text('관우'),
                  ),
                  Text('여포'),
                ],
              ),
            ),

            Divider(
              height: 50,
              thickness: 2,
              color: Colors.red,
            ),
            Text(
              '장비',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}