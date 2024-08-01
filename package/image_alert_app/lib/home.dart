import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late bool _lampState;
  late String _lampStateStr;
  late String _lampImage;

  late String _lampChangeStrTitle;
  late String _lampChangeStr;

  @override
  void initState() {
    super.initState();
    _lampState = true;
    _lampStateStr = '켜진';
    _lampImage = 'images/lamp_on.png';
    _lampChangeStrTitle = '램프 끄기';
    _lampChangeStr = '램프를 끄시겠습니까?';
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
                  onPressed: () => clickBtn(true),//onButton(),
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
  clickBtn(bool state){
    if(state == _lampState){
      showErrorDialog(context);
    }else{
      showChangeDialog(context);
    }
  }

  // onButton(){
  //   if(_lampState){
  //     showErrorDialog(context);
  //   }else{
  //     showChangeDialog(context);
  //   }
  // }

  // offButton(){
  //   if(!_lampState){
  //     showErrorDialog(context);
  //   }else{
  //     showChangeDialog(context);
  //   }
  // }

  showErrorDialog(context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        // 여기에 3항 연산 추가?
        // 조건 ? 
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('경고'),
          content: Text('현재 램프가 $_lampStateStr 상태 입니다.'),
          actions: [
            Center(
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('네, 알겠습니다.'),
              ),
            )
          ],
        );
      },
    );
  }

  showChangeDialog(context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(_lampChangeStrTitle),
          content: Text(_lampChangeStr),
          actions: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => changeState(),
                    child: const Text('네'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('아니요'),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  pushDialog(context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(_lampChangeStrTitle),
          content: Text(_lampChangeStr),
          actions: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => changeState(),
                    child: const Text('네'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('아니요'),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  changeState(){
    if(_lampState){
      _lampState = false;
      _lampStateStr = '꺼진';
      _lampImage = 'images/lamp_off.png';
      _lampChangeStrTitle = '램프 켜기';
      _lampChangeStr = '램프를 켜시겠습니까?';
    }else{
      _lampState = true;
      _lampStateStr = '켜진';
      _lampImage = 'images/lamp_on.png';
      _lampChangeStrTitle = '램프 끄기';
      _lampChangeStr = '램프를 끄시겠습니까?';
    }
    Navigator.of(context).pop();
    setState(() {});
  }
}