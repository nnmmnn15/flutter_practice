import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:json_movie_github_app/edit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;

  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
  }

  getJSONData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/movies.json');
    var response = await http.get(url);
    // print(response.body);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON["results"];
    data.addAll(result);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Test'),
      ),
      body: Center(
        child: data.isEmpty
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    // 왼쪽에서 오른쪽
                    startActionPane: ActionPane(
                      motion: const BehindMotion(),
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.green,
                          icon: Icons.edit,
                          label: 'Edit',
                          onPressed: (context) async {
                            var titleName = await Get.to(
                              const Edit(),
                              arguments: (
                                data[index]['image'],
                                data[index]['title']
                              ),
                            );
                            if (titleName != null) {
                              data[index]['title'] = titleName;
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                    // 오른쪽에서 왼쪽으로 슬라이드
                    endActionPane: ActionPane(
                      motion: const BehindMotion(),
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          label: 'Delete',
                          onPressed: (context) {
                            selectDelete(index);
                          },
                        ),
                      ],
                    ),
                    child: Card(
                      color: index % 2 == 0
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.tertiary,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                data[index]['image'],
                                width: 100,
                              ),
                            ),
                          ),
                          Text(
                            '     ${data[index]['title']}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  // --- Functions ---
  selectDelete(index) {
    showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CupertinoActionSheet(
          title: const Text('경고'),
          message: const Text('선택한 항목을 삭제 하시겠습니까?'),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                data.removeAt(index);
                setState(() {});
                Get.back();
              },
              child: const Text('삭제'),
            )
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
        );
      },
    );
  }
} // End
