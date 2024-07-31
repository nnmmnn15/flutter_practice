import 'package:flutter/material.dart';
import 'package:tabbar_flower_ex_app/view/button_page.dart';
import 'package:tabbar_flower_ex_app/view/swipe_page.dart';
import 'package:tabbar_flower_ex_app/view/timer_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('꽃 이미지'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          SwipePage(),
          ButtonPage(),
          TimerPage(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.green[300],
        height: 100,
        child: TabBar(
          controller: tabController,
          labelColor: Colors.blue[900],
          unselectedLabelColor: Colors.brown[900],

          indicatorColor: Colors.blue,
          indicatorWeight: 5,
          tabs: const [
            Tab(
              icon: Icon(Icons.swipe),
              text: 'Swipe',
            ),
            Tab(
              icon: Icon(Icons.ads_click),
              text: 'Button',
            ),
            Tab(
              icon: Icon(Icons.timer),
              text: 'Timer',
            ),
          ],
        ),
      ),
    );
  }
}
