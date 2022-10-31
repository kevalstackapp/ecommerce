import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/elevated_button.dart';
import 'package:ecommerce/common/widget/text_form_field.dart';
import 'package:ecommerce/screen/forgot_password/forgot_password_view_model.dart';
import 'package:ecommerce/screen/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  ForgotPasswordViewModel? forgotPasswordViewModel;
  TextEditingController email = TextEditingController();
  bool status = false;
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    forgotPasswordViewModel ??
        (forgotPasswordViewModel = ForgotPasswordViewModel(this));

    return WillPopScope(
      onWillPop: () => backPressed(),
      child: Scaffold(
        body: Stack(children: [
          ListView(children: [
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
            Form(key: formGlobalKey,
              child: AppTextField(

                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return 'Please enter your email addresss.';
                  }
                  return null;
                },
                textEditingController: email,
                hintText: StringResources.emailaddres,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    height: 10,
                    ImageResources.emailicon,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CommonElevatedButton(
              onPressed: () async {
                submit();
              },
              text: StringResources.sendemail,
              buttonColor: ColorResource.green,
            ),
          ]),
          status == false
              ? const SizedBox()
              : const Center(
                  child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator())),
        ]),
      ),
    );
  }

  submit() async {
    final isValid = formGlobalKey.currentState?.validate();
    if (isValid!) {
      if (isValid == true) {
        await forgotPasswordViewModel!
            .forgotPasswordMethod(context, email, status = true);
      } else {
        const Text("");
      }
    }
    formGlobalKey.currentState?.save();
  }

  backPressed() async {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return const LoginPage();
      },
    ));
    // return Future<bool>.value(true);
  }
}
