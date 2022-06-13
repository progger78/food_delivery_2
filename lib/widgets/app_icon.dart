import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  AppIcon(
      {Key? key,
      required this.icon,
      required this.press,
      this.size,
      this.color = Colors.black,
      this.backgroundColor = Colors.white})
      : super(key: key);
  final IconData icon;
  final VoidCallback press;
  final Color color;
  final Color backgroundColor;
  double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: Dimensions.height45,
        width: Dimensions.width45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor.withOpacity(0.7),
        ),
        child: Icon(
          
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
