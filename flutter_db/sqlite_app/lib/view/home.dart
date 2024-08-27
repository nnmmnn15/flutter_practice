import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:sqlite_app/view/insert_student.dart';
import 'package:sqlite_app/view/update_student.dart';
import 'package:sqlite_app/vm/database_handler.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DatabaseHandler handler = DatabaseHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite for Student'),
        actions: [
          IconButton(
            onPressed: () => Get.to(
              const InsertStudent(),
            )!
                .then(
              (value) => reloadData(),
            ),
            icon: const Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: FutureBuilder(
        // 특정 함수를 실행 시킴 : future
        future: handler.queryStudents(),
        // 메모리에 있는 함수 실행 결과를 찍어오는 역할 : snapshot
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Slidable(
                  // 오른쪽에서 왼쪽으로 슬라이드
                  endActionPane: ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                        label: 'Delete',
                        onPressed: (context) =>
                            deleteDialog(snapshot.data![index].code),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const UpdateStudent(), arguments: [
                        snapshot.data![index].code,
                        snapshot.data![index].name,
                        snapshot.data![index].dept,
                        snapshot.data![index].phone,
                      ])!
                          .then(
                        (value) => reloadData(),
                      );
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  '학번 :',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(snapshot.data![index].code)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  '이름 :',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(snapshot.data![index].name)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  '전공 :',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(snapshot.data![index].dept)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  '전화번호 :',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(snapshot.data![index].phone)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  reloadData() {
    setState(() {});
  }

  deleteDialog(String code) {
    Get.defaultDialog(
        title: '경고',
        middleText: '정말 삭제하시겠습니까?',
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        barrierDismissible: false,
        actions: [
          TextButton(
            onPressed: () {
              handler.deleteStudents(code);
              Get.back();
              reloadData();
            },
            child: const Text('예'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('아니오'),
          ),
        ]);
  }
}
