import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    List list = [1, 2, 3, 4, 5, 6];
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          height: MediaQuery.of(context).size.height * 0.7,
          child: Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.lock),
                  title: const Text('테스트테스트'),
                  onTap: () {
                    //
                    print('object');
                  },
                ),
                const Divider(
                  height: 0,
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('테스트테스트'),
                  onTap: () {
                    //
                    print('object');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
