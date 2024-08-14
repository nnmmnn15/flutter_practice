import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  XFile? imageFile;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery & Camera'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () => getImageFromDevice(ImageSource.gallery),
                      child: const Text('Gallery'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () => getImageFromDevice(ImageSource.camera),
                      child: const Text('Camera'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              // 현재 기기의 width 크기를 가져옴
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Center(
                // imageFile 은 null 값이 있을 수 있으므로
                child: imageFile == null
                ? const Text('Image is not selected')
                : Image.file(File(imageFile!.path))
              ),
            )
          ],
        ),
      ),
    );
  }

  // --- Functions ---
  getImageFromDevice(imageSource) async{
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if(pickedFile == null){
      imageFile = null;
    } else{
      imageFile = XFile(pickedFile.path);
    }
    setState(() {});
  }
}
