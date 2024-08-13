import 'package:bmi_class_tuple_image/vm/calc_bmi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  // late TextEditingController heightController;
  // late TextEditingController weightController;
  late double height;
  late double weight;

  late String calcResult;
  late String bmiImage;
  late double arrowPos;

  @override
  void initState() {
    super.initState();
    // heightController = TextEditingController(text: '0');
    // weightController = TextEditingController();

    height = 100;
    weight = 0;
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
          Row(
            children: [
              Column(
                children: [
                  const Text(
                    '신장',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: 180,
                    child: CupertinoPicker(
                      itemExtent: 30,
                      scrollController:
                          FixedExtentScrollController(initialItem: 0),
                      onSelectedItemChanged: (value) {
                        height = double.parse((100 + value).toString());
                        calcFunction();
                      },
                      children: List.generate(
                        100, // 0 ~ 100
                        (index) => Center(
                          child: Text('${index + 100}'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    '몸무게',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: 180,
                    child: CupertinoPicker(
                      itemExtent: 30,
                      scrollController:
                          FixedExtentScrollController(initialItem: 0),
                      onSelectedItemChanged: (value) {
                        weight = double.parse(value.toString());
                        calcFunction();
                      },
                      children: List.generate(
                        150,
                        (index) => Center(
                          child: Text('$index'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: ElevatedButton(
          //     onPressed: () => calcFunction(),
          //     child: const Text('BMI 계산'),
          //   ),
          // ),
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
    // if (heightController.text.trim().isEmpty ||
    //     weightController.text.trim().isEmpty) {
    //   if (heightController.text.trim().isEmpty &&
    //       weightController.text.trim().isNotEmpty) {
    //     errorTopSnackBar("신장을 입력해주세요!");
    //   } else if (heightController.text.trim().isNotEmpty &&
    //       weightController.text.trim().isEmpty) {
    //     errorTopSnackBar("몸무게를 입력해주세요!");
    //   } else {
    //     errorTopSnackBar("신장과 몸무게를 입력해주세요!");
    //   }
    //   // top snackbar
    //   arrowPos = -100;
    //   setState(() {});
    // } else {
    //   CalcBMI calcBMI =
    //       CalcBMI(weightController.text.trim(), heightController.text.trim());
    //   (String, String, String, double) resultCalc = calcBMI.calcAction();
    //   calcResult = '귀하의 bmi지수는 ${resultCalc.$1}이고\n ${resultCalc.$2} 입니다.';
    //   arrowPos = resultCalc.$4;
    //   setState(() {});
    // }
    CalcBMI calcBMI = CalcBMI(weight, height);
    (String, String, String, double) resultCalc = calcBMI.calcAction();
    calcResult = '귀하의 bmi지수는 ${resultCalc.$1}이고\n ${resultCalc.$2} 입니다.';
    arrowPos = resultCalc.$4;
    setState(() {});
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
