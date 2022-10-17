import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;

  const CommonText(
      {Key? key, this.text, this.fontSize, this.fontWeight, this.color, this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,textAlign: textAlign,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,overflow: TextOverflow.ellipsis

          )),
    );
  }
}
