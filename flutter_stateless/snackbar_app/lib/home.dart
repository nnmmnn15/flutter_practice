import 'package:flutter/material.dart';
import 'package:snackbar_app/bmi.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snack Bar'),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
ElevatedButton(

  /// function 방법
  onPressed: () => snackBarFunction(context),

  /// 기본 방법
  // onPressed: (){
  //   // snackbar 스낵바
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       content: Text('Elevated Button is clicked'),
  //       backgroundColor: Colors.red,
  //       duration: Duration(seconds: 1),
  //     ),
  //   );
  //   //
  // },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.brown,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        10,
      ),
    ),
    // minimumSize: Size(width, height),
  ),
  child: const Text('Snackbar Button'),
),
            ElevatedButton(
              onPressed: () => bmiButton(context),
              child: const Text('BMI'),
            ),
          ],
        ),
      ),
    );
  }


  // function
  snackBarFunction(context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Elevated Button is clicked'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 1),
      ),
    );
  }

  bmiButton(context){
    Bmi bmi = Bmi(165, 53);
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('BMI는 ${bmi.result}이고 ${bmi.bmiResult(bmi.result)} 입니다.'),
        duration: Duration(seconds: 1),
      )
    );
    print('BMI는 ${bmi.result}이고 ${bmi.bmiResult(bmi.result)}');
  }
}