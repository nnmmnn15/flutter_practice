import 'package:collection_view_label_app/view/detail_hero.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List<String> heroList;

  @override
  void initState() {
    super.initState();
    heroList = [];
    addList();
  }

  addList() {
    heroList.add('유비');
    heroList.add('관우');
    heroList.add('장비');
    heroList.add('조조');
    heroList.add('여포');
    heroList.add('초선');
    heroList.add('손견');
    heroList.add('장양');
    heroList.add('손책');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('삼국지 인물'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: GridView.builder(
            itemCount: heroList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 한줄당 갯수
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ), // 화면 구성
            itemBuilder: (context, index) {
              return Container(
                color: index % 3 == 0
                    ? Colors.red
                    : index % 2 == 0
                        ? Colors.green
                        : Colors.amber,
                child: GestureDetector(
                  onTap: () =>
                      Get.to(const DetailHero(), arguments: heroList[index]),
                  child: Card(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Center(
                      child: Text(heroList[index]),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
