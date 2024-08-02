import 'package:bmi_class_tuple_image/vm/calc_bmi.dart';
import 'package:flutter/material.dart';

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
    heightController = TextEditingController();
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
          TextField(
            controller: heightController,
            decoration: const InputDecoration(
              labelText: '신장을 입력하세요. (cm)'
            ),
          ),
          TextField(
            controller: weightController,
            decoration: const InputDecoration(
              labelText: '몸무게를 입력하세요. (kg)'
            ),
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
          Stack(
            children:[
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
            ]
          ),
        ],
      ),
    );
  }


  calcFunction(){
    if(heightController.text.trim().isEmpty || weightController.text.trim().isEmpty){
      // errorSnackBar();
      arrowPos = -100;
      setState(() {});
    }else{
      CalcBMI calcBMI = CalcBMI(weightController.text.trim(), heightController.text.trim());
      (String, String, String, double) resultCalc = calcBMI.calcAction();
      calcResult = '귀하의 bmi지수는 ${resultCalc.$1}이고\n ${resultCalc.$2} 입니다.';
      // bmiImage = resultCalc.$3;
      arrowPos = resultCalc.$4;
      setState(() {});
    }
    
  }
}