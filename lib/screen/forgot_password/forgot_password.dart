import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/elevated_button.dart';
import 'package:ecommerce/common/widget/text_form_field.dart';
import 'package:ecommerce/screen/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backPressed(),
      child: Scaffold(
        body: ListView(children: [
          ListTile(
            leading: IconButton(
                onPressed: () {
                  return backPressed();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: ColorResource.black,
                )),
            title: Text(
              StringResources.forgotpasswordtitle,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              )),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
              child: Text(StringResources.forgotpassworddocments,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 12,
                    color: ColorResource.grey,
                    fontWeight: FontWeight.w400,
                  )))),
          const SizedBox(
            height: 25,
          ),
          AppTextField(
            hintText: StringResources.emailaddres,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                height: 10,
                ImageResources.emailicon,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CommonElevatedButton(
            onPressed: () {},
            text: StringResources.sendemail,
            buttonColor: ColorResource.green,
          )
        ]),
      ),
    );
  }

  backPressed() async {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return const LoginPage();
      },
    ));
    //  return Future<bool>.value(true);
  }
}
