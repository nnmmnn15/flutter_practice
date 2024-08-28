import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:sqlite_image_app/view/insert_address.dart';
import 'package:sqlite_image_app/view/update_address.dart';
import 'package:sqlite_image_app/vm/database_handler.dart';

class QueryAddress extends StatefulWidget {
  const QueryAddress({super.key});

  @override
  State<QueryAddress> createState() => _QueryAddressState();
}

class _QueryAddressState extends State<QueryAddress> {
  // Property
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('주소록 검색'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => const InsertAddress(),
              )!
                  .then((value) => reloadData());
            },
            icon: const Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: FutureBuilder(
        future: handler.queryAddress(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SlidableAutoCloseBehavior(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => const UpdateAddress(),
                        arguments: [
                          snapshot.data![index].id!,
                          snapshot.data![index].name,
                          snapshot.data![index].phone,
                          snapshot.data![index].address,
                          snapshot.data![index].relation,
                          snapshot.data![index].image,
                        ],
                      )!
                          .then((value) => reloadData());
                    },
                    child: Slidable(
                      groupTag: '0',
                      endActionPane: ActionPane(
                        extentRatio: .3,
                        motion: const BehindMotion(),
                        children: [
                          SlidableAction(
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                            label: 'Delete',
                            onPressed: (context) {
                              deleteDialog(snapshot.data![index].id);
                            },
                          ),
                        ],
                      ),
                      child: Card(
                        child: Row(
                          children: [
                            Image.memory(
                              snapshot.data![index].image,
                              width: 100,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        '이름 : ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(snapshot.data![index].name),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        '전화번호 : ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(snapshot.data![index].phone),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
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

  // --- Functions ---
  reloadData() {
    setState(() {});
  }

  deleteDialog(int? id) {
    Get.defaultDialog(
      title: '경고',
      middleText: '정말 삭제하시겠습니까?',
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
      barrierDismissible: false,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                handler.deleteAddress(id);
                Get.back();
                reloadData();
              },
              child: Text(
                'OK',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onErrorContainer),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'NO',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onErrorContainer),
              ),
            ),
          ],
        ),
      ],
    );
  }
} // End
