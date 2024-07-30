import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator_AppBar'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/send'),
            icon: const Icon(Icons.email),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/received'),
            icon: const Icon(Icons.email_outlined),
          ),
        ],
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/send'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
              child: const Text('보낸 편지함'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/received'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
              child: const Text('받은 편지함'),
            ),
            GestureDetector(
              child: Image.asset(
                'images/pikachu-1.jpg',
                width: 150,
              ),
              onTap: () => Navigator.pushNamed(context, '/send'),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-1.jpg'),
              ),
              accountName: Text('Pikachu'),
              accountEmail: Text('pikachu@naver.com'),
              decoration: BoxDecoration(
                color: Colors.red[400],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.mail,
                color: Colors.blue,
              ),
              title: const Text('보낸 편지함'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/send');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.mail_outline,
                color: Colors.red,
              ),
              title: const Text('받은 편지함'),
              // onTap: () => Navigator.pop(context),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/received');
              },
            ),
          ],
        ),
      ),
    );
  }
}