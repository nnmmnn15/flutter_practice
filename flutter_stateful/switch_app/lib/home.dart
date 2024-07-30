import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late bool switchValue;
  late String appBarTitle;
  late String imageName;

  @override
  void initState() {
    super.initState();
    switchValue = true;
    appBarTitle = 'Pikachu - 1';
    imageName = 'pikachu-1.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text(appBarTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Image.asset(
                'images/$imageName',
                width: 200,
              ),
              onTap: () => touchImage(),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Switch(
                value: switchValue,
                onChanged: (value) {
                  switchValue = value;
                  checkScreen();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  // --- Function ----
  checkScreen(){
    if(switchValue){
      appBarTitle = 'Pikachu - 1';
      imageName = 'pikachu-1.jpg';
    }else{
      appBarTitle = 'Pikachu - 2';
      imageName = 'pikachu-2.jpg';
    }
    
    setState(() {});
  }
  
  touchImage(){
    switchValue = !switchValue;
    checkScreen();
  }
}