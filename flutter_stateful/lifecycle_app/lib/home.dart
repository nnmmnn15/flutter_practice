import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState(); 
}

class _HomeState extends State<Home> {

  // Property 화면에서 바뀌는 것
  late String buttonState;
  late String appBarTitle;
  late Color baseColor;
  late Color btnColor;
  late Color btnTextColor;
  late String imagePath;

  @override
  void initState() {
    super.initState();
    buttonState = 'OFF';
    baseColor = Colors.white;
    btnColor = Colors.white60;
    btnTextColor = Colors.black;
    appBarTitle = 'flutter life cycle';
    imagePath = 'images/pikachu-1.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        title: Text('$appBarTitle - $buttonState'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _onClick(),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: btnColor,
                foregroundColor: btnTextColor
              ),
              child: Text('버튼을 누르세요 $buttonState'),
            ),
            Text('버튼 상태 : $buttonState'),
            Image.asset(
              imagePath,
              width: 150,
            ),
          ],
        ),
      ),
    );
  }


  // --- Funcion ----
  _onClick(){
    if(buttonState == 'OFF'){
      buttonState = 'ON';
      appBarTitle = '플러터 라이프 사이클 / 생명주기';
      baseColor = Colors.amber;
      btnColor = Colors.red;
      btnTextColor = Colors.white;
      imagePath = 'images/smile.png';
    }else{
      buttonState ='OFF';
      appBarTitle = 'flutter life cycle';
      baseColor = Colors.white;
      btnColor = Colors.white60;
      btnTextColor = Colors.black;
      imagePath = 'images/pikachu-1.jpg';
    }
    setState(() {
      
    });
  }
}