import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/smile.png',
              width: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/smile.png',
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Image.asset(
                        'images/smile.png',
                        width: 100,
                      ),
                    ),Image.asset(
                      'images/smile.png',
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Image.asset(
                        'images/smile.png',
                        width: 100,
                      ),
                    ),Image.asset(
                      'images/smile.png',
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Image.asset(
                        'images/smile.png',
                        width: 100,
                      ),
                    ),Image.asset(
                      'images/smile.png',
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Image.asset(
                        'images/smile.png',
                        width: 100,
                      ),
                    ),Image.asset(
                      'images/smile.png',
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Image.asset(
                        'images/smile.png',
                        width: 100,
                      ),
                    ),Image.asset(
                      'images/smile.png',
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Image.asset(
                        'images/smile.png',
                        width: 100,
                      ),
                    ),Image.asset(
                      'images/smile.png',
                      width: 100,
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              'images/smile.png',
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}