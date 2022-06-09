import 'package:flutter/material.dart';
import 'package:food_delivery_2/utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBigText extends StatelessWidget {
  AppBigText(
      {Key? key,
      this.color = const Color.fromARGB(255, 117, 211, 220),
      required this.text,
      this.size = 0,
      this.height = 1.2,
      this.textOverflow = TextOverflow.ellipsis})
      : super(key: key);

  Color color;
  final String text;
  double size;
  double height;
  TextOverflow textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text( 
      
      text,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          height: height,
          
            fontWeight: FontWeight.w500,
            color: color,
            fontSize: size == 0 ? Dimensions.font22 : size,
            ),
      ),
      maxLines: 1,
      overflow: textOverflow,
    );
  }
}
