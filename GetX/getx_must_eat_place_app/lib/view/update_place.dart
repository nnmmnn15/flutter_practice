import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_must_eat_place_app/model/address.dart';
import 'package:getx_must_eat_place_app/vm/vm_handler.dart';
import 'package:image_picker/image_picker.dart';

class UpdatePlace extends StatelessWidget {
  UpdatePlace({super.key});

  final TextEditingController latController = TextEditingController();
  final TextEditingController lngController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController estimateController = TextEditingController();

  final Address address = Get.arguments;
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
          latController.text = address.lat.toString();
          lngController.text = address.lng.toString();
          nameController.text = address.name;
          phoneController.text = address.phone;
          estimateController.text = address.estimate;
          return Center(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () =>
                            controller.getImageFromGallery(ImageSource.gallery),
                        child: const Text('이미지 가져오기'),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            controller.getImageFromGallery(ImageSource.camera),
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
                            ? Image.memory(address.image)
                            : Image.file(File(controller.imageFile!.path))),
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
                    onPressed: () => updateAction(vmHandler),
                    child: const Text('수정'),
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
  updateAction(VmHandler vmhandler) async {
    Uint8List? getImage;
    if (vmhandler.imageFile != null) {
      File imageFile1 = File(vmhandler.imageFile!.path);
      getImage = await imageFile1.readAsBytes();
    }

    Address addressUpdate = Address(
      id: address.id,
      name: nameController.text.trim(),
      phone: phoneController.text.trim(),
      estimate: estimateController.text.trim(),
      lat: double.parse(latController.text.trim()),
      lng: double.parse(lngController.text.trim()),
      image: vmhandler.imageFile == null ? address.image : getImage!,
    );

    await vmhandler.updateAddress(addressUpdate);
    vmhandler.imageFile = null;

    Get.back();
  }
} // End