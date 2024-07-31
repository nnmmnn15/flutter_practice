import 'package:flutter/material.dart';
import 'package:tabbar_app/view/first_page.dart';
import 'package:tabbar_app/view/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{ // 화면에 항상 띄누는?

  // Property
  late TabController controller;

  @override
  void initState() {
    super.initState(); // 앱 시작
    controller = TabController(
      length: 2, // 탭의 갯수
      vsync: this, // 어디에 적용할건지, this = 현재 위치
    );
  }

  @override
  void dispose() { // 앱이 종료될때
    controller.dispose();
    super.dispose(); // 앱 종료
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab Bar Test'),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          FirstPage(),
          SecondPage(),
        ]
      ),
      bottomNavigationBar: Container(
        color: Colors.amberAccent,
        height: 100,
        child: TabBar(
          controller: controller,
          labelColor: Colors.blue,
          indicatorColor: Colors.red,
          indicatorWeight: 5,
          tabs: [
            Tab(
              icon: Icon(
                Icons.looks_one
              ),
              text: 'One',
            ),
            Tab(
              icon: Icon(
                Icons.looks_two
              ),
              text: 'Two',
            ),
          ],
        ),
      ),
    );
  }
}