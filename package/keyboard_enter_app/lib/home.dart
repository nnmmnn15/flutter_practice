import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Key Board Enter'),
      ),
      body: Center(
        child: TextField(
          controller: textEditingController,
          decoration: const InputDecoration(
            labelText: '글자를 입력 하세요',
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          onSubmitted: (value) {
            if (textEditingController.text.trim().isEmpty) {
              showSnackBar('경고', '글씨를 입력하세요', Colors.red);
            } else {
              showSnackBar(
                  '입력완료', '입력한 글자는 ${textEditingController.text.trim()}', Colors.blue);
            }
          },
        ),
      ),
    );
  }

  // --- Functions ---
  showSnackBar(title, message, color) {
    Get.snackbar(
      title,
      message,
      duration: const Duration(seconds: 2),
      colorText: Theme.of(context).colorScheme.onError,
      backgroundColor: color,
    );
  }
} // End