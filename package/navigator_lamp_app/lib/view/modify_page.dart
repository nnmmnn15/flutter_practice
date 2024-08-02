import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/model/lamp_state.dart';

class ModifyPage extends StatefulWidget {
  const ModifyPage({super.key});

  @override
  State<ModifyPage> createState() => _ModifyPageState();
}

class _ModifyPageState extends State<ModifyPage> {
  // Property
  late TextEditingController textEditingController;
  late bool lampState;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.text = LampState.lampText;
    lampState = LampState.lampState;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  lampState ? 'images/lamp_on.png' : 'images/lamp_off.png',
                ),
                backgroundColor: Colors.black,
                radius: 100,
              ),
              TextField(
                controller: textEditingController,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      lampState ? 'On' : 'Off',
                    ),
                    Switch(
                      value: lampState,
                      onChanged: (value) {
                        lampState = value;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => buttonClick(),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buttonClick() {
    LampState.lampState = lampState;
    LampState.lampText = textEditingController.text;
    Navigator.pop(context);
  }
}
