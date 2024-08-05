import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool _lampState;
  late String _lampImage;

  late String _lampStrTitle;
  late String _lampStrMessage;

  @override
  void initState() {
    super.initState();
    _lampState = true;
    _lampImage = 'images/lamp_on.png';
    _lampStrTitle = '램프 끄기';
    _lampStrMessage = '램프를 끄시겠습니까?';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert를 이용한 메세지 출력'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _lampImage,
              width: 200,
              height: 400,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => clickBtn(true), //onButton(),
                  child: const Text('켜기'),
                ),
                ElevatedButton(
                  onPressed: () => clickBtn(false),
                  child: const Text('끄기'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // --- function ---
  clickBtn(bool state) {
    if (state == _lampState) {
      // 변경 없음
      _lampStrTitle = '경고';
      if (_lampState) {
        _lampStrMessage = '현재 램프가 켜진 상태입니다.';
      } else {
        _lampStrMessage = '현재 램프가 꺼진 상태입니다.';
      }
      pushDialog();
    } else {
      
      changeActionSheet();
    }
  }

  pushDialog() {
    Get.defaultDialog(
      title: _lampStrTitle,
      middleText: _lampStrMessage,
      barrierDismissible: false,
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('네, 알겠습니다.'),
        )
      ],
    );
  }

  changeState() {
    if (_lampState) {
      _lampState = false;
      _lampImage = 'images/lamp_off.png';
      _lampStrTitle = '램프 켜기';
      _lampStrMessage = '램프를 켜시겠습니까?';
    } else {
      _lampState = true;
      _lampImage = 'images/lamp_on.png';
      _lampStrTitle = '램프 끄기';
      _lampStrMessage = '램프를 끄시겠습니까?';
    }
    Get.back();
    setState(() {});
  }

  changeActionSheet() {
    showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      builder: (context) => CupertinoActionSheet(
        title: Text(_lampStrTitle),
        message: Text(_lampStrMessage),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => changeState(),
            child: const Text('예'),
          ),
          CupertinoActionSheetAction(
            onPressed: () => Get.back(),
            child: const Text('아니오'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
      ),
    );
  }
}
