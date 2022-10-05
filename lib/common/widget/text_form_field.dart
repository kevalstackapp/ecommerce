import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String? lable;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final String? hintText;
  final Border? border;

  const AppTextField(
      {super.key,
      this.lable,
      this.textInputType,
      this.prefixIcon,
      this.textEditingController,
      this.hintText, this.border,  int? width
     });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 45,
      child: Padding(
        padding: const EdgeInsets.only(left: 25,right: 25),
        child: TextFormField(
          keyboardType: textInputType,
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon:prefixIcon ,
           border: OutlineInputBorder(
              borderSide:
              const BorderSide(width: 0.1, color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
