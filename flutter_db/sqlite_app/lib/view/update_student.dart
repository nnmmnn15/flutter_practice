import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_app/model/students.dart';
import 'package:sqlite_app/vm/database_handler.dart';

class UpdateStudent extends StatefulWidget {
  const UpdateStudent({super.key});

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
  DatabaseHandler handler = DatabaseHandler();
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;

  var value = Get.arguments ?? "__";

  @override
  void initState() {
    super.initState();
    codeController = TextEditingController(text: value[0]);
    nameController = TextEditingController(text: value[1]);
    deptController = TextEditingController(text: value[2]);
    phoneController = TextEditingController(text: value[3]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Update for SQLite'),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: codeController,
                  decoration: const InputDecoration(labelText: '학번'),
                  readOnly: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: '이름을 수정하세요'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: deptController,
                  decoration: const InputDecoration(labelText: '전공을 수정하세요'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: '전화번호를 수정하세요'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      Students students = Students(
                        code: codeController.text.trim(),
                        name: nameController.text.trim(),
                        dept: deptController.text.trim(),
                        phone: phoneController.text.trim(),
                      );
                      int result = await handler.updateStudents(students);
                      if (result == 0) {
                        errorSnackBar('수정');
                      } else {
                        showDialog('수정');
                      }
                    },
                    child: const Text('수정'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      int result = await handler.deleteStudents(codeController.text.trim());
                      if (result == 0) {
                        errorSnackBar('삭제');
                      } else {
                        showDialog('삭제');
                      }
                    },
                    child: const Text('삭제'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  // --- Functions ---

  errorSnackBar(String type) {
    Get.snackbar(
      "경고",
      "$type중 문제가 발생 하였습니다.",
      snackPosition: SnackPosition.TOP,
      colorText: Theme.of(context).colorScheme.onError,
      backgroundColor: Theme.of(context).colorScheme.error,
    );
  }

  showDialog(String type) {
    Get.defaultDialog(
        title: '$type 결과',
        middleText: '$type 완료 되었습니다.',
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        barrierDismissible: false,
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              Get.back();
            },
            child: const Text('OK'),
          )
        ]);
  }
}
