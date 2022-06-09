

import 'package:flutter/material.dart';

import 'app_small_text.dart';

class CardIconText extends StatelessWidget {
  CardIconText({
    Key? key,
    required this.icon,
    required this.color,
    this.size = 30,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final String text;
  double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: size,
          color: color,
        ),
        SizedBox(
          width: 4,
        ),
        AppSmallText(text: text)
      ],
    );
  }
}
