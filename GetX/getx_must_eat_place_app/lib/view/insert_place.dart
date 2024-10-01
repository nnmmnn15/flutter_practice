import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_must_eat_place_app/model/address.dart';
import 'package:getx_must_eat_place_app/vm/vm_handler.dart';
import 'package:image_picker/image_picker.dart';

class InsertPlace extends StatelessWidget {
  InsertPlace({super.key});

  final TextEditingController latController = TextEditingController();
  final TextEditingController lngController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController estimateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vmHandler = Get.put(VmHandler());
    vmHandler.checkLocationPermission();

    return Scaffold(
      appBar: AppBar(
        title: const Text('맛집 추가'),
      ),
      body: GetBuilder<VmHandler>(
        builder: (controller) {
          latController.text = controller.latitude;
          lngController.text = controller.longitude;
          return Center(
            child: controller.latitude.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('GPS 데이터를 수집 중 입니다.'),
                        CircularProgressIndicator()
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () => controller
                                  .getImageFromGallery(ImageSource.gallery),
                              child: const Text('이미지 가져오기'),
                            ),
                            ElevatedButton(
                              onPressed: () => controller
                                  .getImageFromGallery(ImageSource.camera),
                              child: const Text('Camera'),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          color: Colors.grey,
                          child: Center(
                              child: controller.imageFile == null
                                  ? const Text('이미지가 선택되지 않았습니다.')
                                  : Image.file(
                                      File(controller.imageFile!.path))),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 150,
                              child: TextField(
                                controller: latController,
                                decoration: const InputDecoration(
                                  labelText: '위도',
                                ),
                                readOnly: true,
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: TextField(
                                controller: lngController,
                                decoration: const InputDecoration(
                                  labelText: '경도',
                                ),
                                readOnly: true,
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: '이름',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextField(
                          controller: phoneController,
                          decoration: const InputDecoration(
                            labelText: '전화번호',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextField(
                          controller: estimateController,
                          decoration: const InputDecoration(
                            labelText: '평가',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          maxLength: 50,
                        ),
                        ElevatedButton(
                          onPressed: () => insertAction(vmHandler),
                          child: const Text('입력'),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }

  // --- Functions ---
  insertAction(VmHandler vmhandler) async {
    File imageFile1 = File(vmhandler.imageFile!.path);
    Uint8List getImage = await imageFile1.readAsBytes();

    Address addressInsert = Address(
      name: nameController.text.trim(),
      phone: phoneController.text.trim(),
      estimate: estimateController.text.trim(),
      lat: double.parse(latController.text.trim()),
      lng: double.parse(lngController.text.trim()),
      image: getImage,
    );

    await vmhandler.insertAddress(addressInsert);
    vmhandler.imageFile = null;

    Get.back();
  }
} // End
