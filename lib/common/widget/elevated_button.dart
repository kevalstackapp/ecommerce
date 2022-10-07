import 'package:ecommerce/common/constant/color_res.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonElevatedButton extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final double? width;
  final double? margin;
  final double? textSize;
  final double? borderRadius;


  const CommonElevatedButton({
    Key? key,
    this.text,
    this.textColor,
    this.buttonColor,
    this.onPressed,
    this.width,
    this.margin,
    this.borderRadius = 10,
    this.textSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin ?? 30),
      width: width ?? double.infinity,
      height: 44,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
          ),
        ),
        child: Text(
          text!,
          style:  GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ColorResource.white)),
        ),
      ),
    );
  }
}