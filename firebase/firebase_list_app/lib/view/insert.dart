import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Insert extends StatefulWidget {
  const Insert({super.key});

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  XFile? imageFile;
  final ImagePicker picker = ImagePicker();
  File? imgFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert for Students'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: codeController,
              decoration: const InputDecoration(labelText: '학번을 입력 하세요'),
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: '이름을 입력 하세요'),
            ),
            TextField(
              controller: deptController,
              decoration: const InputDecoration(labelText: '전공을 입력 하세요'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: '전화번호를 입력 하세요'),
            ),
            ElevatedButton(
              onPressed: () => getImageFromGallery(ImageSource.gallery),
              child: const Text('Gallery'),
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
            ElevatedButton(
              onPressed: () => insertAction(),
              child: const Text('입력'),
            ),
          ],
        ),
      ),
    );
  }

  // --Functions--
  getImageFromGallery(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    imageFile = XFile(pickedFile!.path);
    imgFile = File(imageFile!.path);
    setState(() {});
  }

  insertAction() async {
    String image = await preparingImage();

    // firebase의 students에 추가
    FirebaseFirestore.instance.collection('students').add({
      'code': codeController.text,
      'name': nameController.text,
      'dept': deptController.text,
      'phone': phoneController.text,
      'image': image
    });

    Get.back();
  }

  preparingImage() async {
    final firebaseStorage = FirebaseStorage.instance
        .ref()
        .child('images/') // 폴더 이름
        .child('${codeController.text}.png');
    await firebaseStorage.putFile(imgFile!); // 이미지 저장

    String downloadURL = await firebaseStorage.getDownloadURL();
    return downloadURL;
  }
}
