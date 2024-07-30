import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
        actions: [
          IconButton(
            onPressed: (){
              //
            },
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const Center(
        child: Text('Drawer'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // ?? 하고 나니까 하얀부분 색으로 채워짐
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-1.jpg'), // 유저 사진
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-2.jpg'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-3.jpg'),
                ),
              ],
              accountName: Text('Pikachu'), // 유저 이름
              accountEmail: Text('Pikachu@naver.com'), // 유저 메일
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            //////aaaaa
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: const Text('Home'),
              onTap: () {
                print('Home is clicked');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.red,
              ),
              title: const Text('설정'),
              onTap: () {
                print('Setting is clicked');
              },
            ),
            
          ],
        ),
      ),
    );
  }
}