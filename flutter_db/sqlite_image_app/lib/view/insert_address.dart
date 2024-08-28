import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqlite_image_app/model/address.dart';
import 'package:sqlite_image_app/vm/database_handler.dart';

class InsertAddress extends StatefulWidget {
  const InsertAddress({super.key});

  @override
  State<InsertAddress> createState() => _InsertAddressState();
}

class _InsertAddressState extends State<InsertAddress> {
  // Property
  late DatabaseHandler handler;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController relationController;

  XFile? imageFile;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    relationController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('주소록 입력'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: '이름을 입력 하세요',
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
                TextField(
                  controller: relationController,
                  decoration: const InputDecoration(
                    labelText: '관계를 입력 하세요',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      getImageFromGallery(ImageSource.gallery);
                    },
                    child: const Text('Gallery'),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  color: Colors.grey,
                  child: Center(
                    child: imageFile == null
                        ? const Text('Image is not selected.')
                        : Image.file(File(imageFile!.path)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      insertAction();
                    },
                    child: const Text('입력'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---Functions---
  Future getImageFromGallery(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile == null) {
      return;
    } else {
      imageFile = XFile(pickedFile.path);
      setState(() {});
    }
  }

  Future insertAction() async {
    // File Type을 Byte Type으로 변환
    File imageFile1 = File(imageFile!.path);
    Uint8List getImage = await imageFile1.readAsBytes();

    var addressInsert = Address(
      name: nameController.text.trim(),
      phone: phoneController.text.trim(),
      address: addressController.text.trim(),
      relation: relationController.text.trim(),
      image: getImage,
    );
    int result = await handler.insertAddress(addressInsert);
    if (result != 0) {
      _showDialog();
    }
  }

  _showDialog() {
    Get.defaultDialog(
      title: '입력 결과',
      middleText: '입력이 완료되었습니다.',
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      barrierDismissible: false,
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            Get.back();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
} // End
