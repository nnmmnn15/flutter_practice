import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/model/lamp.dart';

class ModifyPage extends StatefulWidget {
  const ModifyPage({super.key});

  @override
  State<ModifyPage> createState() => _ModifyPageState();
}

class _ModifyPageState extends State<ModifyPage> {
  late bool colorSwitch;
  late bool lightSwitch;
  late bool rotateSwitch;
  late TextEditingController timerController;

  @override
  void initState() {
    super.initState();
    colorSwitch = Lamp.lampColor;
    lightSwitch = Lamp.lampLight;
    rotateSwitch = Lamp.rotate;
    timerController = TextEditingController(text: Lamp.timer.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
      ),
      body: Center(
        child: SizedBox(
          width: 130,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    colorSwitch ? 'Yellow' : 'Red',
                  ),
                  Switch(
                    value: colorSwitch,
                    onChanged: (value) {
                      colorSwitch = value;
                      setState(() {});
                    },
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      lightSwitch ? 'On' : 'Off',
                    ),
                    Switch(
                      value: lightSwitch,
                      onChanged: (value) {
                        lightSwitch = value;
                        setState(() {});
                      },
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    rotateSwitch ? 'Rotate' : 'noRotate',
                  ),
                  Switch(
                    value: rotateSwitch,
                    onChanged: (value) {
                      rotateSwitch = value;
                      setState(() {});
                    },
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: timerController,
                  decoration: const InputDecoration(
                    labelText: '회전의 시간간격',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => changeLamp(),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Functions ---
  changeLamp(){
    Lamp.lampColor = colorSwitch;
    Lamp.lampLight = lightSwitch;
    Lamp.rotate = rotateSwitch;
    Lamp.timer = int.parse(timerController.text);
    Navigator.pop(context);
  }
} // End
