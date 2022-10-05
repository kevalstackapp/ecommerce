import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget sizeMaring() {
  return const SizedBox(
    height: 15,
  );
}

Widget divderrow() {
  return Row(
    children: const [
      SizedBox(
        width: 145,
        child: Divider(
          color: ColorResource.grey,
        ),
      ),
      Text(
        StringResources.Or,
        style: TextStyle(color: ColorResource.grey),
      ),
      SizedBox(
        width: 139,
        child: Divider(
          color: ColorResource.grey,
        ),
      ),
    ],
  );
}

Widget confmPasswordTextfFlied() {
  return AppTextField(   validator: (value) {
    if (value!.isEmpty) {
      return 'Enter a valid password!';
    }
    return null;
  },
    prefixIcon: Container(
      height: 32,
      width: 32,
      margin: const EdgeInsets.only(top: 7, left: 9, bottom: 8, right: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xff2ECC71).withOpacity(0.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          ImageResources.confmpasswordicon,
        ),
      ),
    ),
    hintText: StringResources.confirmpassword,
  );
}

Widget passwordTextfFlied() {
  return AppTextField(  validator: (value) {
    if (value!.isEmpty) {
      return 'Enter a valid password!';
    }
    return null;
  },
    prefixIcon: Container(
      height: 32,
      width: 32,
      margin: const EdgeInsets.only(top: 7, left: 9, bottom: 8, right: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xff2ECC71).withOpacity(0.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          ImageResources.passwordicon,
        ),
      ),
    ),
    hintText: StringResources.password,
  );
}

Widget phonenumaberTextfFlied() {
  return AppTextField(  validator: (value) {
    if (value!.isEmpty) {
      return 'Enter a valid phoneNumber';
    }
    return null;
  },
    prefixIcon: Container(
      height: 32,
      width: 32,
      margin: const EdgeInsets.only(top: 7, left: 9, bottom: 8, right: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xff2ECC71).withOpacity(0.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          ImageResources.phoneicon,
        ),
      ),
    ),
    hintText: StringResources.phonenumber,
  );
}

Widget emailTextFiled() {
  return AppTextField(
    validator: (value) {
      if (value!.isEmpty ||
          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value)) {
        return 'Enter a valid email!';
      }
      return null;
    },
    prefixIcon: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        height: 10,
        ImageResources.emailicon,
      ),
    ),
    hintText: StringResources.emailaddres,
  );
}

Widget nameTextFiled() {
  return AppTextField(
    validator: (value) {
      if (value!.isEmpty) {
        return 'Enter a valid Name';
      }
      return null;
    },
    prefixIcon: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        height: 10,
        ImageResources.youricon,
      ),
    ),
    hintText: StringResources.yourname,
  );
}
Widget privacyText(BuildContext context, String name) {
  return Text(
    name,
    style: GoogleFonts.poppins(
        textStyle: const TextStyle(
      fontSize: 11,
      color: ColorResource.grey,
      fontWeight: FontWeight.w500,
    )),
  );
}
