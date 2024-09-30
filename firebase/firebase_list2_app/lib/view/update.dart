import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var value = Get.arguments ?? "__";

  XFile? imageFile;
  final ImagePicker picker = ImagePicker();
  File? imgFile;
  int firstDisp = 0;

  @override
  void initState() {
    super.initState();
    codeController.text = value[1];
    nameController.text = value[2];
    deptController.text = value[3];
    phoneController.text = value[4];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update for Students'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: codeController,
              decoration: const InputDecoration(labelText: '학번을 수정 하세요'),
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: '이름을 수정 하세요'),
            ),
            TextField(
              controller: deptController,
              decoration: const InputDecoration(labelText: '전공을 수정 하세요'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: '전화번호를 수정 하세요'),
            ),
            ElevatedButton(
              onPressed: () => getImageFromGallery(ImageSource.gallery),
              child: const Text('Gallery'),
            ),
            firstDisp == 0
                ? Container(
                    height: 200,
                    color: Colors.grey,
                    child: Center(
                      child: Image.network(value[5]),
                    ),
                  )
                : Container(
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
              onPressed: () {
                if (firstDisp == 0) {
                  updateAction();
                } else {
                  updateActionAll();
                }
              },
              child: const Text('수정'),
            ),
          ],
        ),
      ),
    );
  }

  // --Functions--
  getImageFromGallery(ImageSource imageSource) async {
    firstDisp = 1;
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    imageFile = XFile(pickedFile!.path);
    imgFile = File(imageFile!.path);
    setState(() {});
  }

  updateAction() async {
    // firebase의 students의 특정 doc id값의 데이터를 업데이트
    FirebaseFirestore.instance.collection('students').doc(value[0]).update({
      'code': codeController.text,
      'name': nameController.text,
      'dept': deptController.text,
      'phone': phoneController.text,
    });

    Get.back();
  }

  updateActionAll() async {
    // 이미지 삭제동작
    await deleteImage();
    String image = await preparingImage();

    // firebase의 students의 특정 doc id값의 데이터를 업데이트
    FirebaseFirestore.instance.collection('students').doc(value[0]).update({
      'code': codeController.text,
      'name': nameController.text,
      'dept': deptController.text,
      'phone': phoneController.text,
      'image': image,
    });

    Get.back();
  }

  deleteImage() async {
    final firebaseStorage = FirebaseStorage.instance
        .ref()
        .child('images')
        .child('${codeController.text.trim()}.png');

    await firebaseStorage.delete();
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
