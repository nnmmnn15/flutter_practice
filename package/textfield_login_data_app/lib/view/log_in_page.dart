import 'package:flutter/material.dart';
import 'package:textfield_login_data_app/model/user_id.dart';
import 'package:textfield_login_data_app/view/coin_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  // property
  late TextEditingController idController;
  late TextEditingController pwController;
  late String checkId;
  late String checkPw;
  late String snackBarText;
  late Color snackBarColor;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwController = TextEditingController();
    checkId = 'root';
    checkPw = 'qwer1234';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(50.0),
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('images/login.png',),
                ),
              ),
              TextField(
                controller: idController,
                decoration: const InputDecoration(
                  labelText: '사용자 ID 입력하세요',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  controller: pwController,
                  decoration: const InputDecoration(
                    labelText: '패스워드를 입력하세요',
                  ),
                  obscureText: true,
                ),
              ),
              ElevatedButton(
                onPressed: () => logInButton(),
                child: const Text(
                  'Log In',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Function ---
  logInButton() {
    if (idController.text == checkId && pwController.text == checkPw) {
      showLoginAlert();
    } else if (idController.text.trim().isEmpty ||
        pwController.text.trim().isEmpty) {
      snackBarText = '사용자ID와 암호를 입력하세요!';
      snackBarColor = Colors.red;
      errorSnackBar();
    } else {
      snackBarText = '사용자ID나 암호가 맞지 않습니다!';
      snackBarColor = Colors.blue;
      errorSnackBar();
    }
  }

  errorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(snackBarText),
      duration: const Duration(seconds: 2),
      backgroundColor: snackBarColor,
    ));
  }

  showLoginAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '환영합니다!',
          ),
          content: const Text(
            "신분이 확인 되었습니다.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      UserId.userId = idController.text.trim();
                      return CoinPage(id: idController.text);
                    },
                  ),
                );
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }
} // end
