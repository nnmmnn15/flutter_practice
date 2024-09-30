import 'package:get/get_state_manager/get_state_manager.dart';

class Calc extends GetxController {
  int num1 = 0;
  int num2 = 0;

  int add = 0;
  int sub = 0;
  int mul = 0;
  double div = 0;

  calcAction() {
    addCalc();
    subCalc();
    mulCalc();
    divCalc();
    update();
  }

  addCalc() {
    // addition
    add = num1 + num2;
  }

  subCalc() {
    // subtraction
    sub = num1 - num2;
  }

  mulCalc() {
    // multiplication
    mul = num1 * num2;
  }

  divCalc() {
    // division
    div = num1 / num2;
  }
}
