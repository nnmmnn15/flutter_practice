import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  late String userId;
  late String password;

  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    userId = "";
    password = "";
    initStorage();
  }

  initStorage(){
    userId = box.read('p_userId');
    password = box.read('p_password');
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