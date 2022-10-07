import 'package:ecommerce/common/constant/color_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  double? topPadding;
  double? bottomPadding;
  double? fontSize;
  double? iconHeight;
  double? iconWidth;
  FontWeight? fontWeight;
  Function()? onTap;
  Color? buttonColor;
  String? text;
  String? buttonIcon;

  AppButton(
      {super.key,
        this.topPadding,
        this.bottomPadding,
        this.text,
        this.fontSize,
        this.onTap,
        this.buttonColor,
        this.buttonIcon,
        this.iconHeight,
        this.iconWidth,
        this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          left: 25,
          right: 25,
          top: topPadding ?? 0,
          bottom: bottomPadding ?? 0,
        ),
        child: Container(
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(6)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (buttonIcon == null)
                  ? const SizedBox()
                  : Container(
                  height: iconHeight,
                  width: iconWidth,
                  margin: const EdgeInsets.only(right: 13.52),
                  child: SvgPicture.asset(
                    buttonIcon!,
                    fit: BoxFit.fill,
                  )),
              (text == null)? Text(""):Text(
                text!,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ColorResource.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}