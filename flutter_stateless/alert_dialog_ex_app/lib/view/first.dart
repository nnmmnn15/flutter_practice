import 'package:flutter/material.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert and push'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _alertDialog(context),
          child: Text('Move the 2nd page'),
        ),
      ),
    );
  }

  _alertDialog(context){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          title: Text('Page 이동'),
          content: Text('아래의 버튼을 누르면 페이지 이동을 합니다.'),
          actions: [
            ElevatedButton(
              // onPressed: () => Navigator.pushNamed(context, '/sec'),
              onPressed: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/sec');
              },
              child: Text('Page 이동'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            )
          ],
        );
      },
    );
  }
}