import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String _imageName;
  late double _lampWidth;
  late double _lampHeight;
  late bool _lampZoomSwitch;
  late bool _lampLightSwitch;
  late bool _lampColorSwitch;

  @override
  void initState() {
    super.initState();
    _imageName = 'images/lamp_on.png';
    _lampHeight = 300;
    _lampWidth = 150;
    _lampZoomSwitch = false;
    _lampLightSwitch = true;
    _lampColorSwitch = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image 확대 및 축소'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 330,
              height: 630,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _imageName,
                    width: _lampWidth,
                    height: _lampHeight,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      '전구 색깔',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Switch(
                      value: _lampColorSwitch,
                      onChanged: (value) {
                        _lampColorSwitch = value;
                        changeLampState();
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      '전구 확대',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Switch(
                      value: _lampZoomSwitch,
                      onChanged: (value) {
                        _lampZoomSwitch = value;
                        changeLampSize();
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      '전구 스위치',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Switch(
                      value: _lampLightSwitch,
                      onChanged: (value) {
                        _lampLightSwitch = value;
                        changeLampState();
                      },
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  changeLampSize(){
    if(_lampZoomSwitch){
      _lampHeight = 600;
      _lampWidth = 300;
    }else{
      _lampHeight = 300;
      _lampWidth = 150;
    }
    setState(() {});
  }

  changeLampState(){
    if(_lampLightSwitch && _lampColorSwitch){
      _imageName = 'images/lamp_red.png';
    }else if(!_lampColorSwitch && _lampLightSwitch){
      _imageName = 'images/lamp_on.png';
    }else{
      _imageName = 'images/lamp_off.png';
    }
    // 위와 같은 코드
    // if(_lampLightSwitch){
    //   if(_lampColorSwitch){
    //     _imageName = 'images/lamp_red.png';
    //   }else{
    //     _imageName = 'images/lamp_on.png';
    //   }
    // }else{
    //   _imageName = 'images/lamp_off.png';
    // }
    setState(() {});
  }

}