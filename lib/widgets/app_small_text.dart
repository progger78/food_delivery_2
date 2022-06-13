import 'package:flutter/material.dart';
import 'package:food_delivery_2/utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

class AppSmallText extends StatelessWidget {
  AppSmallText(
      {Key? key,
      this.textOverflow,
      this.color = const Color.fromARGB(255, 156, 156, 156),
      required this.text,
      this.size,
      this.height = 1.2})
      : super(key: key);

  Color? color;
  final String text;
  double? size;
  TextOverflow? textOverflow;
  double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.justify,
      
      overflow: textOverflow,
      text,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          height: height,
          fontWeight: FontWeight.w500,
          color: color,
          fontSize: Dimensions.font16,
          
        ),
      ),
    );
  }
}
