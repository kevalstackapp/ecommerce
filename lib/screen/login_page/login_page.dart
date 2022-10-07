import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/app_button.dart';
import 'package:ecommerce/common/widget/elevated_button.dart';
import 'package:ecommerce/screen/forgot_password/forgot_password.dart';
import 'package:ecommerce/screen/register_page/register_page.dart';
import 'package:ecommerce/screen/register_page/widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      backgroundColor: ColorResource.green,
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        Center(
          child: SizedBox(
              height: 80,
              child: Image.asset(
                ImageResources.loginLogo,
              )),
        ),
        Text(
          StringResources.loginname,
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: ColorResource.white)),
        ),
        sizeMaring(),
        Expanded(
          child: Container(
              decoration: const BoxDecoration(
                  color: ColorResource.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Form(
                child: ListView(
                  children: [
                    Center(
                      child: Text(StringResources.logintitlename,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ))),
                    ),
                    Center(
                      child: Text(StringResources.logintitlesecondname,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 14,
                            color: ColorResource.grey,
                            fontWeight: FontWeight.w400,
                          ))),
                    ),
                    sizeMaring(),
                    emailTextFiled(),
                    sizeMaring(),
                    passwordTextfFlied(),
                    sizeMaring(),
                    Padding(
                      padding: const EdgeInsets.only(left: 180),
                      child: TextButton(
                          onPressed: () {

                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const Forgotpassword();
                            },));
                          },
                          child: Text(
                            StringResources.forgotpassword,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              fontSize: 13,
                              color: ColorResource.black,
                              fontWeight: FontWeight.w400,
                            )),
                          )),
                    ),
                    CommonElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      buttonColor: ColorResource.green,
                      text: StringResources.loginname,
                      textColor: ColorResource.white,
                    ),
                    sizeMaring(),
                    Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: divderrow()),
                    sizeMaring(),
                    AppButton(
                      buttonColor: ColorResource.blue,
                      buttonIcon: ImageResources.fackbookicon,
                      text: StringResources.Facebookname,
                    ),
                    sizeMaring(),
                    AppButton(
                      buttonColor: ColorResource.black,
                      buttonIcon: ImageResources.appleicon,
                      text: StringResources.applename,
                    ),
                    sizeMaring(),
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Row(children: [
                        privacyText(
                            context, """Didn’t have an account?"""),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return const RegisterPage();
                              },));
                            },
                            child: Text(
                              StringResources.registerpage,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 13,
                                    color: ColorResource.black,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ))
                      ],),
                    ),
                    sizeMaring(),
                  ],
                ),
              )),
        ),
      ]),
    );
  }
}
