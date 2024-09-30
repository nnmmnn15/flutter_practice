import 'package:bmi_image_app/vm/bmi_calc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  final BmiCalc bmiCalc = Get.put(BmiCalc());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI 계산기'),
      ),
      body: GetBuilder<BmiCalc>(
        builder: (controller) {
          return Center(
            child: Column(
              children: [
                TextField(
                  controller: heightController,
                  decoration: const InputDecoration(labelText: '신장을 입력하세요(cm)'),
                ),
                TextField(
                  controller: weightController,
                  decoration:
                      const InputDecoration(labelText: '몸무게를 입력하세요(kg)'),
                ),
                ElevatedButton(
                  onPressed: () => calcAction(),
                  child: const Text('BMI 계산'),
                ),
                Text(bmiCalc.bmiString),
                Stack(
                  children: [
                    Image.asset("images/${bmiCalc.imagePath}"),
                    Positioned(
                      left: bmiCalc.moveArrow,
                      child: const Icon(Icons.arrow_downward),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  // ---Function---
  calcAction() {
    if (heightController.text.trim().isEmpty ||
        weightController.text.trim().isEmpty) {
      bmiCalc.errorInput();
    } else {
      bmiCalc.height = double.parse(heightController.text.trim());
      bmiCalc.weight = double.parse(weightController.text.trim());
      bmiCalc.calcAction();
    }
  }
}
