import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  late String userId;
  late String password;

  @override
  void initState() {
    super.initState();
    userId = "";
    password = "";
    initSharedPreferences();
  }

  initSharedPreferences()async{
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('p_userId')!;
    password = prefs.getString('p_password')!;
    setState(() {}); // await 동안 build가 이미 화면을 생성 했을 경우를 대비
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ID와 PW를 출력'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("User  Id : $userId"),
            Text("Password : $password"),
          ],
        ),
      ),
    );
  }
}