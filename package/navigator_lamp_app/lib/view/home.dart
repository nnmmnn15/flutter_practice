import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/model/lamp_state.dart';
import 'package:navigator_lamp_app/view/modify_page.dart';

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
        title: const Text('Main 화면'),
        leading: const Icon(Icons.home),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                LampState.lampText = textEditingController.text;
                return const ModifyPage();
              },
            )).then(
              (value) {
                textEditingController.text = LampState.lampText;
                setState(() {});
              },
            ),
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: '글자를 입력하세요',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Image.asset(
                  LampState.lampState
                      ? 'images/lamp_on.png'
                      : 'images/lamp_off.png',
                  width: 150,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
