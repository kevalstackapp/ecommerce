

import 'package:flutter/material.dart';

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
          left: 14,
          right: 18,
          top: topPadding ?? 0,
          bottom: bottomPadding ?? 0,
        ),
        child: Container(
          height: 58,
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
                  child: Image.asset(
                    buttonIcon!,
                    fit: BoxFit.fill,
                  )),




            ],
          ),
        ),
      ),
    );
  }
}

