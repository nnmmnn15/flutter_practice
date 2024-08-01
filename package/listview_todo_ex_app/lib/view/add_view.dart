import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/model/message.dart';

class AddView extends StatefulWidget {
  const AddView({super.key});

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {

  late TextEditingController textEditingController;
  late bool purchaseSwitch;
  late bool promiseSwitch;
  late bool studySwitch;
  late String imagePath;

  late List<bool> switchValue;
  late List<String> imagePathList;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    purchaseSwitch = true;
    promiseSwitch = false;
    studySwitch = false;

    switchValue = [true, false, false];
    imagePathList = ['images/cart.png', 'images/clock.png', 'images/pencil.png'];

    imagePath = 'images/cart.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add View'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('구매'),
              Switch(
                value: switchValue[0],
                // value: purchaseSwitch,
                onChanged: (value) {
                  // purchaseSwitch = value;
                  checkSwitch(0);
                },
              ),
              Image.asset('images/cart.png')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('약속'),
              Switch(
                value: switchValue[1],
                // value: promiseSwitch,
                onChanged: (value) {
                  // promiseSwitch = value;
                  checkSwitch(1);
                },
              ),
              Image.asset('images/clock.png')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('스터디'),
              Switch(
                value: switchValue[2],
                // value: studySwitch,
                onChanged: (value) {
                  // studySwitch = value;
                  checkSwitch(2);
                },
              ),
              Image.asset('images/pencil.png')
            ],
          ),


          TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              labelText: '목록을 입력하세요',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if(textEditingController.text.trim().isNotEmpty){
                setDataPush();
              }
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // --- Function ---
  setDataPush(){
    Message.imagePath = imagePath;
    Message.todoText = textEditingController.text.trim();
    Message.addAble = true;
  }

  // 변경필요 다른 버튼을 누르면 체크 되어있는거 풀리고 누른것만 적용되도록 변경해야함
  // checkSwitch(){
  //   if(purchaseSwitch){
  //     promiseSwitch = false;
  //     studySwitch = false;
  //     imagePath = 'images/cart.png';
  //   }else if(promiseSwitch){
  //     purchaseSwitch = false;
  //     studySwitch = false;
  //     imagePath = 'images/clock.png';
  //   }else if(studySwitch){
  //     purchaseSwitch = false;
  //     promiseSwitch = false;
  //     imagePath = 'images/pencil.png';
  //   }

  //   setState(() {});
  // }
  
  checkSwitch(int index){
    for(int i = 0; i < switchValue.length; i++){
      switchValue[i] = false;
    }
    switchValue[index] = true;
    imagePath = imagePathList[index];
    setState(() {});
  }
}