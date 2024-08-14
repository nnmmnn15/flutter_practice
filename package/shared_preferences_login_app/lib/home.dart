import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_login_app/second.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  late TextEditingController userIdController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    userIdController = TextEditingController();
    passwordController = TextEditingController();

    // Shared Preferences 초기화
    initSharedPreferences();
  }

  initSharedPreferences() async {
    // 저장공간? 생성
    final prefs = await SharedPreferences.getInstance();
    // prefs의 p_userId라는 변수에서 값을 가져옴 없으면 ""
    userIdController.text = prefs.getString('p_userId') ?? "";
    passwordController.text = prefs.getString('p_password') ?? "";

    // 메모리에 결과 값이 남아 있는지 테스트
    print(userIdController.text);
    print(passwordController.text);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        disposeSharedPreferences();
      default:
        break;
    }
  }

  disposeSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    // password만 삭제
    prefs.remove('p_password');
    // prefs.clear(); // 전체 삭제
  }

  @override
  void dispose() {
    super.dispose();
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
            saveSharedPreferences();
            Get.to(
              const Second(),
            );
          },
          child: const Text('Exit'),
        ),
      ],
    );
  }

  saveSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('p_userId', userIdController.text.trim());
    prefs.setString('p_password', passwordController.text.trim());
  }
} // End
