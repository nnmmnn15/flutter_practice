import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text('영웅 Card'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/Lee.jpg'),
                radius: 70,
              ),
            ),
            const Divider(
              color: Colors.black,
              indent: 20,
              endIndent: 20,
              height: 40,
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '성웅',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(2, 0, 0, 5),
                    child: Text(
                      '이순신 장군',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  const Text(
                    '전적',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 0, 8),
                    child: Text(
                      '62전 62승',
                      style: TextStyle(
                        color: Colors.pink[300],
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Column(
                          children: [
                            Icon(Icons.check_circle_outline),
                            Icon(Icons.check_circle_outline),
                            Icon(Icons.check_circle_outline),
                            Icon(Icons.check_circle_outline),
                            Icon(Icons.check_circle_outline),
                            Icon(Icons.check_circle_outline),
                            Icon(Icons.check_circle_outline),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Text('옥포해전'),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Text('사천포해전'),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Text('당포해전'),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Text('한산도대첩'),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Text('부산포해전'),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Text('명량해전'),
                          ),
                          Text('노량해전'),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const CircleAvatar(
              backgroundImage: AssetImage('images/turtle.gif'),
              radius: 40,
              backgroundColor: Colors.orange,
            )
          ],
        ),
      ),
    );
  }
}