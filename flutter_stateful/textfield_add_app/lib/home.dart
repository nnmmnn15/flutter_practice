import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late int sum;
  late String sumText;
  RegExp regex = RegExp(r"^[0-9]$");

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    sum = 0;
    sumText = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('덧셈 구하기'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: TextField(
                      controller: num1Controller,
                      decoration: const InputDecoration(
                        labelText: '첫번째 숫자를 입력하세요.',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Text(
                    '+',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 150,
                      child: TextField(
                        controller: num2Controller,
                        decoration: const InputDecoration(
                          labelText: '두번째 숫자를 입력하세요.',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton(
                  onPressed: () => addButton(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                  child: const Text(
                    '덧셈 계산',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                sumText,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  

  addButton(){
    
    if(num1Controller.text.trim().isEmpty || num2Controller.text.trim().isEmpty){
      errorSnackBar();
      sumText = '';
    } else {
      sum = int.parse(num1Controller.text.trim()) +
          int.parse(num2Controller.text.trim());
      sumText = '입력하신 숫자의 합은 $sum 입니다.';
    }

    setState(() {});
  }

  errorSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('숫자를 입력하세요.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      )
  );
}
}