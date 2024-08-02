import 'package:flutter/material.dart';
import 'package:textfield_login_data_app/model/user_id.dart';

class CoinPage extends StatefulWidget {
  final String id;
  const CoinPage({super.key, required this.id});

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "${widget.id},${UserId.userId}님! 환영합니다!",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('images/bitcoin.jpg'),
          radius: 150,
        )
        //Image.asset('images/bitcoin.jpg'),
      ),
    );
  }
}
