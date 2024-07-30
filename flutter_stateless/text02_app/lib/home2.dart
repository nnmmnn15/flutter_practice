import 'package:flutter/material.dart';

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text with Column and Row2'),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email_rounded),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Icon(Icons.account_balance),
                  ),
                  Icon(Icons.account_circle),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('James'),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 13, 0, 13),
                  child: Text('Cathy'),
                ),
                Text('Kenny'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}