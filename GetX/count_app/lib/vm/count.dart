import 'package:get/get_state_manager/get_state_manager.dart';

class Count extends GetxController {
  int counter = 0;

  add() {
    counter += 1;
    // 데이터의 변경을 화면에 알려야함
    update();
  }

  subtract() {
    counter -= 1;
    update();
  }
}
