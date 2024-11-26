import 'package:flutter/material.dart';

class WebTxtFeild extends StatelessWidget {
  final TextEditingController controller;
  final String labelString;
  final double h;

  const WebTxtFeild(
      {super.key,
      required this.controller,
      required this.labelString,
      this.h = 50});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      child: TextField(
        controller: controller,
        expands: true,
        maxLines: null,
        decoration: InputDecoration(
          labelText: labelString,
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 5.0),
          ),
        ),
      ),
    );
  }
}
