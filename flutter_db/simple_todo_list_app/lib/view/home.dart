import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:simple_todo_list_app/model/todo.dart';
import 'package:simple_todo_list_app/vm/data_handler.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DataHandler handler = DataHandler();

  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Lists'),
        actions: [
          IconButton(
            onPressed: () => _showDialog(context),
            icon: const Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: FutureBuilder(
        future: handler.queryTodoList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SlidableAutoCloseBehavior(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    groupTag: '0',
                    endActionPane: ActionPane(
                      extentRatio: .3,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          borderRadius: BorderRadius.circular(10),
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          onPressed: (context) {
                            deleteDialog(snapshot.data![index].taskId);
                          },
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onLongPress: () async{
                        print(snapshot.data![index].taskCheck);
                        await handler.checkTodoList(snapshot.data![index].taskId, snapshot.data![index].taskCheck);
                        setState(() {});
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today_rounded),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  '${snapshot.data![index].task} / ${snapshot.data![index].date}',
                                  style: TextStyle(
                                    decoration:
                                        snapshot.data![index].taskCheck == 1
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: Text('일정이 없습니다.'),
              // child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  _showDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Todo List'),
          content: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              labelText: '추가할 내용',
              fillColor: Theme.of(context).colorScheme.primary,
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () async {
                  Todo todo = Todo(
                    task: textEditingController.text.trim(),
                  );
                  int result = await handler.insertTodoList(todo);
                  if (result == 0) {
                    errorSnackBar();
                  } else {
                    Get.back();
                    textEditingController.text = "";
                    setState(() {});
                    successShowDialog();
                  }
                },
                child: const Text('추가하기'),
              ),
            )
          ],
        );
      },
    );
  }

  errorSnackBar() {
    Get.snackbar(
      "경고",
      "입력중 문제가 발생 하였습니다.",
      snackPosition: SnackPosition.TOP,
      colorText: Theme.of(context).colorScheme.onError,
      backgroundColor: Theme.of(context).colorScheme.error,
    );
  }

  successShowDialog() {
    Get.defaultDialog(
        title: '입력 결과',
        middleText: '입력이 완료 되었습니다.',
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        barrierDismissible: false,
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          )
        ]);
  }

  deleteDialog(int? id) {
    Get.defaultDialog(
        title: '경고',
        middleText: '정말 삭제하시겠습니까?',
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        barrierDismissible: false,
        actions: [
          TextButton(
            onPressed: () {
              handler.deleteTodoList(id);
              Get.back();
              setState(() {});
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
