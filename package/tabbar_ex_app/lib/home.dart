import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tabbar_ex_app/view/pikachu1.dart';
import 'package:tabbar_ex_app/view/pikachu2.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2,vsync: this);
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
        title: const Text('피카츄 이미지 텝바'),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          Pikachu1(),
          Pikachu2(),
        ]
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: TabBar(
          controller: tabController,
          indicatorWeight: 5,
          indicatorSize: TabBarIndicatorSize.values[1],
          tabs: const [
            Tab(
              icon: Icon(Icons.alarm_rounded),
              text: 'Pikachu Screen #1',
            ),
            Tab(
              icon: Icon(Icons.account_box_rounded),
              text: 'Pikachu Screen #2',
            ),
          ],
        ),
      ),
    );
  }
}