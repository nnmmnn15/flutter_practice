import 'package:flutter/material.dart';
import 'package:textfield_add_sol_app/vm/add_calc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Property
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late String calcResult;

  @override // 상속
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    calcResult = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('덧셈 구하기'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              decoration: const InputDecoration(
                labelText: '첫번째 숫자를 입력하세요.',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: num2Controller,
              decoration: const InputDecoration(
                labelText: '두번째 숫자를 입력하세요.',
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                calcCheck();
              },
              child: const Text('덧셈 계산'),
            ),
            Text(
              calcResult,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Functions ---
  calcCheck(){
    if(num1Controller.text.trim().isEmpty || num2Controller.text.trim().isEmpty){
      errorSnackBar();
    }else{
      AddCalc addCalc = 
          AddCalc(num1Controller.text.trim(), num2Controller.text.trim());
      calcResult = addCalc.addAction();
      setState(() {});
    }

  }

  errorSnackBar(){
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('글자를 입력 하세요.'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    )
  );
}

}