import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:listview_insert_app/model/animal.dart';

class FirstPage extends StatefulWidget {
  // Property
  final List<Animal> list;

  const FirstPage({super.key, required this.list});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey(widget.list[index]),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                widget.list.remove(widget.list[index]);
                setState(() {});
              },
              child: GestureDetector(
                onTap: () => _showDialog(index),
                child: Card(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          widget.list[index].imagePath,
                          width: 100,
                        ),
                      ),
                      Text('   ${widget.list[index].animalName}')
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // --- Functions ---
  _showDialog(int index) {
    Get.defaultDialog(
        title: widget.list[index].animalName,
        titleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        // middleText: '이 동물은 ${widget.list[index].kind} 입니다.\n'
        //     '${widget.list[index].flyExist ? "날 수 있습니다." : "날 수 없습니다."}',
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.list[index].imagePath,width: 30,),
            Text('이 동물은 ${widget.list[index].kind} 입니다.\n'
            '${widget.list[index].flyExist ? "날 수 있습니다." : "날 수 없습니다."}',)
          ],
        ),
        barrierDismissible: false,
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('종료'),
          ),
        ]);
  }
} // End