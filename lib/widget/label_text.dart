import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelText extends StatelessWidget {
  const LabelText({
    Key? key, required this.text, this.color = Colors.black, this.fontWeight = FontWeight.bold,  this.fontSize,
  }) : super(key: key);

  final String text;
  final Color? color;
  final FontWeight fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.passionOne(
        textStyle: TextStyle(
            fontSize: fontSize??size.height * 0.025,
            fontWeight: fontWeight,
            color: color),
      )
    );
  }
}