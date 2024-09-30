import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textfield_calc_ex_app/vm/calc.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  final TextEditingController addController = TextEditingController();
  final TextEditingController subController = TextEditingController();
  final TextEditingController mulController = TextEditingController();
  final TextEditingController divController = TextEditingController();

  // final Calc calc = Get.put(Calc());

  @override
  Widget build(BuildContext context) {
    Get.put(Calc());
    return Scaffold(
      appBar: AppBar(
        title: const Text('간단한 계산기'),
      ),
      body: GetBuilder<Calc>(
        builder: (calc) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Center(
                child: Column(
                  children: [
                    TextField(
                      controller: num1Controller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: '첫번째 숫자를 입력 하세요',
                      ),
                    ),
                    TextField(
                      controller: num2Controller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: '두번째 숫자를 입력 하세요',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () => calcButton(calc),
                            child: const Text('계산하기'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () => removeButton(),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary),
                            child: Text(
                              '지우기',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: addController,
                              readOnly: true,
                              decoration: const InputDecoration(
                                labelText: '덧셈 결과',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: subController,
                              readOnly: true,
                              decoration: const InputDecoration(
                                labelText: '뺄셈 결과',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: mulController,
                              readOnly: true,
                              decoration: const InputDecoration(
                                labelText: '곱셈 결과',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: divController,
                              readOnly: true,
                              decoration: const InputDecoration(
                                labelText: '나눗셈 결과',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // --- Functions ---
  calcButton(Calc calc) {
    if (num1Controller.text.trim().isEmpty ||
        num2Controller.text.trim().isEmpty) {
      errorSnackBar();
    } else {
      calc.num1 = int.parse(num1Controller.text.trim());
      calc.num2 = int.parse(num2Controller.text.trim());
      calc.calcAction();
      addController.text = calc.add.toString();
      subController.text = calc.sub.toString();
      mulController.text = calc.mul.toString();
      divController.text = calc.div.toStringAsFixed(4);
    }
  }

  removeButton() {
    num1Controller.text = '';
    num2Controller.text = '';
    addController.text = '';
    subController.text = '';
    mulController.text = '';
    divController.text = '';
  }

  errorSnackBar() {
    Get.snackbar(
      'Error',
      '숫자를 입력하세요',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
