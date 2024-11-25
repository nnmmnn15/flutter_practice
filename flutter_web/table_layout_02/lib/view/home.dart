import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_layout_02/vm/movie_vm.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final movieVm = Get.put(MovieVm());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies List'),
      ),
      body: Obx(
        () => Center(
          child: DataTable(
            dataRowMinHeight: 100,
            dataRowMaxHeight: 300,
            columns: const [
              DataColumn(
                label: Text(
                  'Cinema Poster',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Cinema Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
            rows: movieVm.tableData.value,
          ),
        ),
      ),
    );
  }
}
