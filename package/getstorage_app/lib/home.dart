import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'second.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController userIdController;
  late TextEditingController passwordController;

  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    userIdController = TextEditingController();
    passwordController = TextEditingController();

    // 초기화
    initStorage();
  }

  initStorage(){
    box.write('p_user', "");
    box.write('p_password', "");
  }

  @override
  void dispose() {
    disposeStorage();
    super.dispose();
  }

  disposeStorage(){
    box.erase(); // 전부 지움
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/login.png'),
                  radius: 70,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: userIdController,
                  decoration: const InputDecoration(
                    labelText: '사용자 ID를 입력 하세요',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: '패스워드를 입력 하세요',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (userIdController.text.trim().isEmpty ||
                        passwordController.text.trim().isEmpty) {
                      errorSnackBar();
                    } else {
                      _showDialog();
                    }
                  },
                  child: const Text('Log In'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // --- Functions ---
  errorSnackBar() {
    Get.snackbar(
      '경고',
      '사용자 ID와 암호를 입력하세요',
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      colorText: Theme.of(context).colorScheme.onError,
      backgroundColor: Theme.of(context).colorScheme.error,
    );
  }

  _showDialog() {
    Get.defaultDialog(
      title: '환영 합니다',
      middleText: '신분이 확인 되었습니다',
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      barrierDismissible: false,
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            saveStorage();
            Get.to(
              const Second(),
            );
          },
          child: const Text('Exit'),
        ),
      ],
    );
  }

  saveStorage(){
    box.write('p_userId', userIdController.text.trim());
    box.write('p_password', passwordController.text.trim());
  }

} // End
