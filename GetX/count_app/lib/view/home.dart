import 'package:count_app/vm/count.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Count count = Get.put(Count());
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX - State'),
      ),
      // Count 객체가 변할때 마다 변경
      body: GetBuilder<Count>(
        builder: (controller) {
          return Center(
            child: Text(
              count.counter.toString(),
              style: const TextStyle(fontSize: 40),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () => count.add(),
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () => count.subtract(),
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
