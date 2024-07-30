import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Property
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single Textfield'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration( // 입력할 때 데코
                  labelText: '글자를 입력 하세요', // 글을 입력하면 위로 올라가 남아있음
                  // hintText: '글자를 입력 하세요', // 글을 입력하면 사라짐
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => inputCheck(),
              child: const Text('출력'),
            )
          ],
        ),
      ),
    );
  }


  // --- Functions ---
  inputCheck(){
    print(nameController.text);
    if(nameController.text.trim().isEmpty){ // trim() 문자열의 스페이스바를 제거
      errorSnackBar();
    }else{
      showSnackBar();
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

  showSnackBar(){
    String inputValue = nameController.text.trim();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('입력한 글자는 $inputValue 입니다.'),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )
    );
  }

}