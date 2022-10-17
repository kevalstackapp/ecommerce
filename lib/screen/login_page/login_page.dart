import 'package:ecommerce/common/app/shred_preference.dart';
import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/app_button.dart';
import 'package:ecommerce/common/widget/elevated_button.dart';
import 'package:ecommerce/screen/forgot_password/forgot_password.dart';
import 'package:ecommerce/screen/login_page/login_page_view_model.dart';
import 'package:ecommerce/screen/register_page/register_page.dart';
import 'package:ecommerce/screen/register_page/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginPageViewModel? loginPageViewModel;
  bool status = false;
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    loginPageViewModel ?? (loginPageViewModel = LoginPageViewModel(this));
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorResource.green,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
        //backgroundColor: ColorResource.green,
        body: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: 170,
            width: double.infinity,
            color: ColorResource.green,
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                    height: 56,
                    width: 90,
                    child: Image.asset(
                      ImageResources.looklogo,
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
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: ColorResource.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Stack(
                children: [
                  Form(key: formGlobalKey,
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
                        emailTextFiled(email),
                        sizeMaring(),
                        passwordTextfFlied(password),
                        sizeMaring(),
                        Padding(
                          padding: const EdgeInsets.only(left: 180),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const Forgotpassword();
                                  },
                                ));
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
                          onPressed: () async {
                            submit();
                            log("========dkff");
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
                          child: Row(
                            children: [
                              privacyText(
                                  context, """Didn’t have an account?"""),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                      builder: (context) {
                                        return const RegisterPage();
                                      },
                                    ));
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
                            ],
                          ),
                        ),
                        sizeMaring(),
                      ],
                    ),
                  ),
                  status == false
                      ? const SizedBox()
                      : Center(
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.black26,
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )),
                            child: const Center(
                                child: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: CircularProgressIndicator())),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  submit() async {
    final isValid = formGlobalKey.currentState?.validate();
    if (isValid!) {
      if (isValid == true) {
        await loginPageViewModel!.loginUPMethod(
            context, email, password, status = true);
      } else {
        const Text("");
      }
    }
    formGlobalKey.currentState?.save();
  }
}