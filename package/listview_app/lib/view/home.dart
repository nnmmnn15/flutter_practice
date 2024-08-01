import 'package:flutter/material.dart';
import 'package:listview_app/view/animal_page.dart';
import 'package:listview_app/view/second.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: const [
          AnimalPage(),
          Second(),
        ]
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.white12,
        child: TabBar(
          controller: controller,
          indicatorColor: Colors.red,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.blue,
          tabs: const [
            Tab(
              icon: Icon(Icons.looks_one),
            ),
            Tab(
              icon: Icon(Icons.looks_two),
            ),
          ],
        ),
      ),
    );
  }
}