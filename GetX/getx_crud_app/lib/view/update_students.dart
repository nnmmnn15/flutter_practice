import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crud_app/vm/vm_handler.dart';

class UpdateStudents extends StatelessWidget {
  UpdateStudents({super.key});

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
        title: const Text('Update for CRUD'),
      ),
      body: GetBuilder<VmHandler>(
        builder: (controller) {
          return Center(
            child: Column(
              children: [
                TextField(
                  controller: codeController,
                  decoration: const InputDecoration(
                    labelText: '학번을 수정 하세요',
                  ),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: '이름을 수정 하세요',
                  ),
                ),
                TextField(
                  controller: deptController,
                  decoration: const InputDecoration(
                    labelText: '전공을 수정 하세요',
                  ),
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: '전화번호를 수정 하세요',
                  ),
                ),
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    labelText: '주소를 수정 하세요',
                  ),
                ),
                ElevatedButton(
                  onPressed: () => updateJSONData(vmHandler),
                  child: const Text('수정'),
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
        await vmHandler.updateJSONData(code, name, dept, phone, address);
    if (result == "OK") {
      Get.back();
    } else {
      print('Error');
    }
  }
} // End