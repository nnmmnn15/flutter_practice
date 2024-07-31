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
  late String _lampChangeStr;

  @override
  void initState() {
    super.initState();
    _lampState = true;
    _lampStateStr = '켜진';
    _lampImage = 'images/lamp_on.png';
    _lampChangeStr = '끄';
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
                  onPressed: () => onButton(),
                  child: const Text('켜기'),
                ),
                ElevatedButton(
                  onPressed: () => offButton(),
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
  onButton(){
    if(_lampState){
      showErrorDialog(context);
    }else{
      showChangeDialog(context);
    }
  }

  offButton(){
    if(!_lampState){
      showErrorDialog(context);
    }else{
      showChangeDialog(context);
    }
  }

  showErrorDialog(context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
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
          title: Text('램프 $_lampChangeStr기'),
          content: Text('램프를 $_lampChangeStr시겠습니까?.'),
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
      _lampChangeStr = '꺼';
    }else{
      _lampState = true;
      _lampStateStr = '켜진';
      _lampImage = 'images/lamp_on.png';
      _lampChangeStr = '끄';
    }
    Navigator.of(context).pop();
    setState(() {});
  }
}