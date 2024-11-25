import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'images/header_image.png',
          width: 800,
          // 그림의 투명도 색상에 따라 그림 위의 흐릿한 색상 변경
          color: const Color.fromRGBO(255, 255, 255, 0.5),
          colorBlendMode: BlendMode.modulate,
        ),
        Text(
          'Out Courses',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: ResponsiveValue(
              context,
              defaultValue: 60.0,
              conditionalValues: [
                const Condition.smallerThan(value: 40.0, name: MOBILE),
                const Condition.largerThan(value: 80.0, name: TABLET),
              ],
            ).value,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
