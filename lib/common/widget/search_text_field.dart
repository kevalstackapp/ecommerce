import 'package:ecommerce/common/constant/color_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextField extends StatelessWidget {
  String? hintText;
  String? icon;
  double? fontSize;

  SearchTextField({super.key, this.hintText, this.icon, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      width: 200,
      alignment: Alignment.center,
      child: TextField(
        style: const TextStyle(color: ColorResource.black),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 5, left: 10),
            filled: true,
            prefixIcon: Container(
                height: 20,
                width: 20,
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  icon!,
                  fit: BoxFit.contain,
                )),
            fillColor: const Color(0xff19C060),
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400,
                    color: ColorResource.white)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorResource.darkgreen)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorResource.darkgreen)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(),
                borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}
