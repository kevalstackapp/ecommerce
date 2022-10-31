import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:ecommerce/common/widget/common_navigator.dart';
import 'package:ecommerce/common/widget/snack_bar_widget.dart';
import 'package:ecommerce/rest_api/rest_services.dart';
import 'package:ecommerce/screen/forgot_password/forgot_password.dart';
import 'package:ecommerce/screen/login_page/login_page.dart';
import 'package:flutter/cupertino.dart';

class ForgotPasswordViewModel {
  final ForgotPasswordState? forgotPasswordState;

  ForgotPasswordViewModel(this.forgotPasswordState);

  Future<void> forgotPasswordMethod(
      BuildContext context, TextEditingController email, bool status) async {
    try {
      forgotPasswordState!.setState(() {
        status = true;
      });
      String? forgotUserResponse =
          await RestServices.postRestMethodWithParameter(
              endPoints: RestServices.forgotApi + email.text);

      if (forgotUserResponse != null && forgotUserResponse.isNotEmpty) {
        Map<String, dynamic> forgotUserResponseMap =
            jsonDecode(forgotUserResponse);

        if (forgotUserResponseMap.containsKey('Success') &&
            forgotUserResponseMap['Success']) {
          appSnackBar(forgotPasswordState!.context, text: "${forgotUserResponseMap['Message']}");

          Navigator.pushAndRemoveUntil(
            forgotPasswordState!.context,
            CommonNavigator(child: const LoginPage()),
                (route) => false,
          );
        } else {
          forgotPasswordState!.status = false;
          forgotPasswordState!.setState(() {
            appSnackBar(context, text: "${forgotUserResponseMap['Message']}");
          });
        }
      }
    } on SocketException catch (e) {
      log("SocketException in forgotPassword${e.message}");
      forgotPasswordState!.setState(() {
        status = false;
      });
    }
  }
}
