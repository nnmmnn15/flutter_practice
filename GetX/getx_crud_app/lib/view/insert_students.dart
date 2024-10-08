import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crud_app/vm/vm_handler.dart';

class InsertStudents extends StatelessWidget {
  InsertStudents({super.key});

  final TextEditingController codeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController deptController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vmHandler = Get.put(VmHandler());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert for CRUD'),
      ),
      body: GetBuilder<VmHandler>(
        builder: (controller) {
          return Center(
            child: Column(
              children: [
                TextField(
                  controller: codeController,
                  decoration: const InputDecoration(labelText: '학번을 입력 하세요'),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: '이름을 입력 하세요',
                  ),
                ),
                TextField(
                  controller: deptController,
                  decoration: const InputDecoration(
                    labelText: '전공을 입력 하세요',
                  ),
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: '전화번호를 입력 하세요',
                  ),
                ),
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    labelText: '주소를 입력 하세요',
                  ),
                ),
                ElevatedButton(
                  onPressed: () => updateJSONData(vmHandler),
                  child: const Text('입력'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // --- Functions ---
  updateJSONData(VmHandler vmHandler) async {
    String code = codeController.text.trim();
    String name = nameController.text.trim();
    String dept = deptController.text.trim();
    String phone = phoneController.text.trim();
    String address = addressController.text.trim();

    var result =
        await vmHandler.insertJSONData(code, name, dept, phone, address);
    if (result == "OK") {
      Get.back();
    } else {
      print('Error');
    }
  }
} // End
