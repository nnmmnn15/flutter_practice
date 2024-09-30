import 'package:get/get_state_manager/get_state_manager.dart';

class BmiCalc extends GetxController {
  double height = 0;
  double weight = 0;
  double bmi = 0;

  String imagePath = 'set.png';
  String bmiString = '';
  double moveArrow = -30;

  calcAction() {
    bmi =
        double.parse((weight / ((height * height) / 10000)).toStringAsFixed(1));
    if (bmi < 18.4) {
      bmiString = '귀하의 bmi지수는 $bmi 이고 저체중 입니다.';
      // imagePath = 'under.png';
      moveArrow = 20;
    } else if (bmi >= 18.5 && bmi <= 22.9) {
      bmiString = '귀하의 bmi지수는 $bmi 이고 정상체중 입니다.';
      // imagePath = 'normal.png';
      moveArrow = 115;
    } else if (bmi >= 23 && bmi <= 24.9) {
      bmiString = '귀하의 bmi지수는 $bmi 이고 과체중 입니다.';
      // imagePath = 'over.png';
      moveArrow = 200;
    } else if (bmi >= 25 && bmi <= 29.9) {
      bmiString = '귀하의 bmi지수는 $bmi 이고 비만 입니다.';
      // imagePath = 'obe.png';
      moveArrow = 285;
    } else {
      bmiString = '귀하의 bmi지수는 $bmi 이고 고도비만 입니다.';
      // imagePath = 'ex.png';
      moveArrow = 380;
    }
    update();
  }

  errorInput() {
    bmiString = '빈칸을 입력해주세요';
    moveArrow = -30;
    update();
  }
}
