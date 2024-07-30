import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  // Property
  late int count;

  @override
  void initState() {
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '현재 클릭수는 $count 입니다.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // FloatingActionButton(
            //   onPressed: (){
            //     count++;
            //     setState(() {});
            //   },
            //   backgroundColor: Colors.blue,
            //   foregroundColor: Colors.white,
            //   child: const Icon(Icons.add),
            // )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: (){
          count++;
          setState(() {
            
          });
        },
        child: const Text('Add 1'),
      ),
    );
  }
}