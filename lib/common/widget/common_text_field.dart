import 'package:ecommerce/common/constant/color_res.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextField extends StatelessWidget {
  final String? lable;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final String? hintText;
  final Border? border;
  final String? Function(String?)? validator;
  ValueChanged<String>? onFieldSubmitted;
  bool obscureText = false;
  final double? fontSize;
  final FontWeight? fontWeight;
  int? maxLines = 1;
  int? maxLength;
  final String? errorText;
  CommonTextField(
      {super.key,
      this.lable,
      this.textInputType,
      this.prefixIcon,
      this.textEditingController,
      this.hintText,
      this.border,
      int? width,
      this.validator,
      this.onFieldSubmitted,
      this.fontSize,
      this.fontWeight,this.maxLines,this.maxLength, this.errorText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: TextFormField(
          maxLines: maxLines,
          maxLength: maxLength,
          onFieldSubmitted: onFieldSubmitted,
          keyboardType: textInputType,
          controller: textEditingController,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(errorText: errorText,
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorResource.green),
                borderRadius: BorderRadius.circular(10)),
            contentPadding: const EdgeInsets.only(top: 5, left: 15),
            hintText: hintText,
            prefixIcon: prefixIcon,
            hintStyle: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ColorResource.black)),
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 0.1, color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
