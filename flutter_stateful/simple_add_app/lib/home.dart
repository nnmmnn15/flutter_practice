import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Property
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late int sum;
  

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    sum = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('간단한 덧셈 계산기'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                '덧셈 결과 : $sum',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: num1Controller,
                  keyboardType: TextInputType.number, // 키보드 타입 중에서 숫자타입
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: num2Controller,
                  keyboardType: TextInputType.number, // 키보드 타입 중에서 숫자타입
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () => inputCheck(),
                  child: const Row(
                    children: [
                      Icon(Icons.add),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('덧셈 계산'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- functions ---
  inputCheck(){
    
    if(num1Controller.text.trim().isEmpty || num2Controller.text.trim().isEmpty){
      errorSnackBar();
    } else {
      sum = int.parse(num1Controller.text.trim()) + 
            int.parse(num1Controller.text.trim());
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