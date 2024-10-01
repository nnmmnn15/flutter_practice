import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crud_app/vm/vm_handler.dart';

class DeleteStudents extends StatelessWidget {
  DeleteStudents({super.key});

  final value = Get.arguments ?? "__";

  final TextEditingController codeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController deptController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    codeController.text = value[0];
    nameController.text = value[1];
    deptController.text = value[2];
    phoneController.text = value[3];
    addressController.text = value[4];

    final vmHandler = Get.put(VmHandler());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete for CRUD'),
      ),
      body: GetBuilder<VmHandler>(
        builder: (controller) {
          return Center(
            child: Column(
              children: [
                TextField(
                  controller: codeController,
                  decoration: const InputDecoration(
                    labelText: '학번 입니다',
                  ),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: '이름 입니다',
                  ),
                ),
                TextField(
                  controller: deptController,
                  decoration: const InputDecoration(
                    labelText: '전공 입니다',
                  ),
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: '전화번호 입니다',
                  ),
                ),
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    labelText: '주소 입니다.',
                  ),
                ),
                ElevatedButton(
                  onPressed: () => deleteJSONData(vmHandler),
                  child: const Text('삭제'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // --- Functions ---
  deleteJSONData(VmHandler vmHandler) async {
    String code = codeController.text.trim();

    var result = await vmHandler.deleteJSONData(code);
    if (result == "OK") {
      Get.back();
    } else {
      print('Error');
    }
  }
} // End
