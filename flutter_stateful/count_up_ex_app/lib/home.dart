import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Property
  late int count;
  late double imgSize;

  @override
  void initState() {
    super.initState();
    count = 0;
    imgSize = 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Up & Down'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('현재 클릭수는 $count 입니다.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      count++;
                      imgSize++;
                      setState(() {});
                    },
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: const Icon(Icons.add),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    count--;
                    count = count < 0 ? 0 : count;
                    imgSize --;
                    setState(() {});
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            Image.asset(
              'images/pikachu-1.jpg',
              width: imgSize,
            ),
          ],
        ),
      ),
    );
  }
}