import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    var movieInfo = Get.arguments ?? '__';
    return Scaffold(
      appBar: AppBar(
        title: Text(movieInfo[1].toString()),
      ),
      body: Center(
        child: Image.network(movieInfo[0]),
      ),
    );
  }
}
