import 'dart:convert';
import 'dart:io';
import 'package:country_pickers/country.dart';
import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_navigator.dart';
import 'package:ecommerce/common/widget/snack_bar_widget.dart';
import 'package:ecommerce/common/widget/text_form_field.dart';
import 'package:ecommerce/model/login_model.dart';
import 'package:ecommerce/model/look_prior_sign_up.dart';
import 'package:ecommerce/rest_api/rest_services.dart';
import 'package:ecommerce/screen/login_page/login_page.dart';
import 'package:ecommerce/screen/navigator_all_page/navigator_all_page.dart';
import 'package:ecommerce/screen/register_page/register_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/app/shred_preference.dart';

class RegisterPageViewModel {
  final RegisterPageState registerPageState;

  RegisterPageViewModel(this.registerPageState);

  ShredPreference shredPreference = ShredPreference();

  signUpMethod(
    BuildContext context,
    TextEditingController userName,
    TextEditingController email,
    TextEditingController phoneNumber,
    TextEditingController password,
    TextEditingController confirmPassword,
    Country selectedDialogCountry,
    String mToken,
    String a,
    bool status,
  ) async {
    try {
      registerPageState.setState(() {
        status = true;
      });
      LookPriorSignUp signMap = LookPriorSignUp(
          name: userName.text,
          email: email.text,
          countryCode: selectedDialogCountry.phoneCode,
          phoneNumber: phoneNumber.text,
          password: password.text,
          deviceToken: mToken,
          deviceType: a);
      String? signUserResponse = await RestServices.postRestMethods(
          endpoints: RestServices.signApi, bodyParam: signMap.toJson());
      if (signUserResponse != null && signUserResponse.isNotEmpty) {
        Map<String, dynamic> signUserResponseMap = jsonDecode(signUserResponse);
        if (signUserResponseMap.containsKey('Success') &&
            signUserResponseMap['Success']) {
          if (registerPageState.mounted) {
            appSnackBar(registerPageState.context,
                text: "${signUserResponseMap['Message']}");
            Navigator.pushAndRemoveUntil(
              context,
              CommonNavigator(child: const LoginPage()),
              (route) => false,
            );
          }
        } else {
          registerPageState.status = false;
          registerPageState.setState(() {
            appSnackBar(context, text: "${signUserResponseMap['Message']}");
          });
        }
      }
    } on SocketException catch (e) {
      log("Catch socket in signUpMethod --> ${e.message}");
      registerPageState.setState(() {
        status = false;
      });
    }
  }

  backButton(BuildContext context) {
    Navigator.of(context).pop(true);
  }

  googleSignMethod(
    BuildContext context,
    String id,
    String email,
    String? displayName,
    bool status,
  ) async {
    try {
      registerPageState.setState(() {
        status = true;
      });

      Map<String, dynamic> googleLoginMap = {
        'devicetoken': await FirebaseMessaging.instance.getToken(),
        "devicetype": 1,
        "email": email,
        "googleId": id,
        "userName": displayName,
        "facebookProfileUrl": "",
        "mobileVersion": "Android",
        "osVersion": "10.11",
        "ViaSocial": 2
      };
      log('LoginMap --> $googleLoginMap');
      String? googleUserResponse = await RestServices.postRestMethods(
          endpoints: RestServices.googleApi, bodyParam: googleLoginMap);
      if (googleUserResponse != null && googleUserResponse.isNotEmpty) {
        Map<String, dynamic> googleUserResponseMap =
            jsonDecode(googleUserResponse);
        if (googleUserResponseMap.containsKey('Success') &&
            googleUserResponseMap['Success']) {
          LoginModel loginModel = loginModelFromJson(googleUserResponse);
          log('LoginModel --> ${loginModel.toJson()}');

          await shredPreference.setPrefStringValue(shredPreference.store,
              "${googleUserResponseMap['access_token']}");

          if(registerPageState.mounted){
            appSnackBar(context, text: "${googleUserResponseMap['Message']}");

            Navigator.pushAndRemoveUntil(
              context,
              CommonNavigator(child: const NavigatorAllPage()),
                  (route) => false,
            );
          }
        } else {
          registerPageState.status = false;
          registerPageState.setState(() {
            appSnackBar(context, text: "${googleUserResponseMap['Message']}");
          });
        }
      }
    } on SocketException catch (e) {
      log("Catch socket in loginUPMethod --> ${e.message}");
      log(e.message);
      registerPageState.setState(() {
        status = true;
      });
    }
  }
}

Widget sizeMarking() {
  return const SizedBox(
    height: 15,
  );
}

Widget divRow() {
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

Widget confirmPasswordTextFlied(TextEditingController confirmPassword) {
  return AppTextField(
    obscureText: true,
    textInputType: TextInputType.visiblePassword,
    textEditingController: confirmPassword,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Please enter Confirm Password.';
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

Widget passwordTextFlied(TextEditingController password) {
  return AppTextField(
    obscureText: true,
    textInputType: TextInputType.visiblePassword,
    textEditingController: password,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Please enter Password. ';
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

Widget phoneNumberTextFlied(TextEditingController phoneNumber) {
  return AppTextField(
    textInputType: TextInputType.phone,
    textEditingController: phoneNumber,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Please enter PhoneNumber';
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

Widget emailTextFiled(TextEditingController email) {
  return AppTextField(
    textInputType: TextInputType.emailAddress,
    textEditingController: email,
    validator: (value) {
      if (value!.isEmpty ||
          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value)) {
        return 'Please enter your email address.';
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

Widget nameTextFiled(TextEditingController userName) {
  return AppTextField(
    textInputType: TextInputType.name,
    textEditingController: userName,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Please enter user name.';
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
