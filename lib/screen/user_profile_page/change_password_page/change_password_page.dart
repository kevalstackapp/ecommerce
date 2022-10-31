import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:ecommerce/common/widget/elevated_button.dart';
import 'package:ecommerce/screen/user_profile_page/change_password_page/change_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => ChangePasswordPageState();
}

class ChangePasswordPageState extends State<ChangePasswordPage> {
  ChangePasswordViewModel? changePasswordViewModel;

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  bool status = false;

  @override
  Widget build(BuildContext context) {
    changePasswordViewModel ??
        (changePasswordViewModel = (ChangePasswordViewModel(this)));
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorResource.green,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorResource.green,
        title: const CommonText(
          text: StringResources.changePassword,
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: ColorResource.white,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Form(
            key: formGlobalKey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextFormField(
                  controller: oldPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Old Password';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  cursorColor: ColorResource.green,
                  decoration: InputDecoration(
                    focusColor: ColorResource.black,
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorResource.green),
                    ),
                    contentPadding: const EdgeInsets.only(top: 10),
                    hintText: StringResources.oldPassword,
                    hintStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: ColorResource.black)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextFormField(
                  controller: newPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter New Password';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  cursorColor: ColorResource.green,
                  decoration: InputDecoration(
                    focusColor: ColorResource.black,
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorResource.green),
                    ),
                    contentPadding: const EdgeInsets.only(top: 10),
                    hintText: StringResources.newPassword,
                    hintStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: ColorResource.black)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextFormField(
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Confirm Password';
                    }
                    return null;
                  },
                  style: const TextStyle(fontSize: 20),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  cursorColor: ColorResource.green,
                  decoration: InputDecoration(
                    focusColor: ColorResource.black,
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorResource.green),
                    ),
                    contentPadding: const EdgeInsets.only(top: 10),
                    hintText: StringResources.confirmpassword,
                    hintStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: ColorResource.black)),
                  ),
                ),
              ),
            ]),
          ),
          status == false
              ? const SizedBox()
              : const Center(
                  child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator())),
        ],
      ),
      bottomSheet: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: CommonElevatedButton(
          borderRadius: 5,
          margin: 15,
          onPressed: () {
            submit();
          },
          buttonColor: ColorResource.green,
          textSize: 16,
          text: StringResources.updatePassword,
        ),
      ),
    );
  }

  submit() async {
    final isValid = formGlobalKey.currentState?.validate();
    if (isValid!) {
      if (isValid == true) {
        await changePasswordViewModel!.changePasswordMethod(context,
            oldPasswordController, newPasswordController, status = true);
      } else {
        const Text("");
      }
    }
    formGlobalKey.currentState?.save();

  }
}
