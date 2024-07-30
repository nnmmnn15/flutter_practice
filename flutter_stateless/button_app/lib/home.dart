import 'package:flutter/material.dart';

/*
  주 버튼은 elevatedButton
*/
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => textButtonAction(),
              onLongPress: () => textButtonLongAction(),
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: Text(
                'Text Button',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ), // 둥근 정도
                ),
              ),
              child: const Text('Elevated Button'),
            ),
            OutlinedButton(
              onPressed: () {
                //
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green,
                side: const BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: const Text('Outlined Button'),
            ),
            TextButton.icon(
              onPressed: () {
                //
              },
              icon: const Icon(
                Icons.home,
                size: 30,
                color: Colors.red,
              ),
              label: const Text('Go to home'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                //
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
                minimumSize: const Size(150, 40),
              ),
              icon: const Icon(Icons.home),
              label: const Text('Home'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: (){
                    //
                  },
                  child: const Text(
                    'TextButton',
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.lightBlue,
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    //
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      // borderRadius: BorderRadius.horizontal(left: Radius.circular(20))
                    ),
                    backgroundColor: Colors.lightBlue[400],
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('ElevatedButton'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // --- funtions ----
  textButtonAction() {
    print('Hello World');
  }

  textButtonLongAction() {
    print('Hello World2');
  }
}
