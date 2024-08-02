import 'package:bmi_class_tuple_image/vm/calc_bmi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late TextEditingController heightController;
  late TextEditingController weightController;
  late String calcResult;
  late String bmiImage;
  late double arrowPos;

  @override
  void initState() {
    super.initState();
    heightController = TextEditingController(text: '0');
    weightController = TextEditingController();
    calcResult = '';
    bmiImage = 'set.png';
    arrowPos = -100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI 계산기'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30,
                    child: IconButton(
                      onPressed: () {
                        heightController.text =
                            (int.parse(heightController.text.trim()) - 1)
                                .toString();
                        setState(() {});
                      },
                      icon: const Icon(Icons.remove),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: TextField(
                      controller: heightController,
                      decoration:
                          const InputDecoration(labelText: '신장을 입력하세요. (cm)'),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    child: IconButton(
                      onPressed: () {
                        heightController.text =
                            (int.parse(heightController.text.trim()) + 1)
                                .toString();
                        setState(() {});
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 180,
                child: TextField(
                  controller: weightController,
                  decoration:
                      const InputDecoration(labelText: '몸무게를 입력하세요. (kg)'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () => calcFunction(),
              child: const Text('BMI 계산'),
            ),
          ),
          Text(
            calcResult,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Stack(children: [
            Image.asset(
              'images/$bmiImage',
            ),
            Positioned(
              left: arrowPos,
              child: const Icon(
                Icons.arrow_downward,
                size: 50,
              ),
            ),
          ]),
        ],
      ),
    );
  }

  calcFunction() {
    if (heightController.text.trim().isEmpty ||
        weightController.text.trim().isEmpty) {
      if (heightController.text.trim().isEmpty &&
          weightController.text.trim().isNotEmpty) {
        errorTopSnackBar("신장을 입력해주세요!");
      } else if (heightController.text.trim().isNotEmpty &&
          weightController.text.trim().isEmpty) {
        errorTopSnackBar("몸무게를 입력해주세요!");
      } else {
        errorTopSnackBar("신장과 몸무게를 입력해주세요!");
      }
      // top snackbar
      arrowPos = -100;
      setState(() {});
    } else {
      CalcBMI calcBMI =
          CalcBMI(weightController.text.trim(), heightController.text.trim());
      (String, String, String, double) resultCalc = calcBMI.calcAction();
      calcResult = '귀하의 bmi지수는 ${resultCalc.$1}이고\n ${resultCalc.$2} 입니다.';
      arrowPos = resultCalc.$4;
      setState(() {});
    }
  }

  errorTopSnackBar(String errorMassage) {
    Get.snackbar(
      '입력 오류',
      errorMassage,
      backgroundColor: Colors.black54,
      colorText: Colors.white,
    );
  }
}
