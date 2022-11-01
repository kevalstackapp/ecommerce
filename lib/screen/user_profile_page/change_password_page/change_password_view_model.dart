import 'dart:convert';
import 'dart:io';

import 'package:ecommerce/common/app/shred_preference.dart';
import 'package:ecommerce/common/widget/common_navigator.dart';
import 'package:ecommerce/common/widget/snack_bar_widget.dart';
import 'package:ecommerce/rest_api/rest_services.dart';

import 'package:ecommerce/screen/user_profile_page/change_password_page/change_password_page.dart';
import 'package:ecommerce/screen/user_profile_page/user_profile_page.dart';
import 'package:flutter/cupertino.dart';

class ChangePasswordViewModel {
  ChangePasswordPageState? changePasswordPageState;

  ChangePasswordViewModel(this.changePasswordPageState);

  ShredPreference shredPreference = ShredPreference();
  String token = "";

  changePasswordMethod(
      BuildContext context,
      TextEditingController oldPasswordController,
      TextEditingController newPasswordController,
      bool status) async {
    token = (await shredPreference.getPrefStringValue(shredPreference.store))!;
    try {
      changePasswordPageState!.setState(() {
        status = true;
      });
      Map<String, dynamic> changePasswordMap = {
        'oldPassword': oldPasswordController.text,
        'newPassword': newPasswordController.text
      };
      log('changePasswordMap-->$changePasswordMap');
      String? changePasswordResponse =
          await RestServices.postRestMethodsWithHeaders(
        bodyParam: changePasswordMap,
        endpoints: RestServices.changePasswordApi,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      if (changePasswordResponse != null && changePasswordResponse.isNotEmpty) {
        Map<String, dynamic> changePasswordResponseMap =
            jsonDecode(changePasswordResponse);
        if (changePasswordResponseMap.containsKey('Success') &&
            changePasswordResponseMap['Success']) {
          appSnackBar(changePasswordPageState!.context,
              text: "${changePasswordResponseMap['Message']}");
          Navigator.pushAndRemoveUntil(
            changePasswordPageState!.context,
            CommonNavigator(child: const UserProfilePage()),
            (route) => false,
          );
        } else {
          changePasswordPageState!.status = false;
          changePasswordPageState!.setState(() {});
          appSnackBar(context, text: "${changePasswordResponseMap['Message']}");
        }
      }
    } on SocketException catch (e) {
      log("Catch socket in signUpMethod --> ${e.message}");
      changePasswordPageState!.setState(() {
        status = false;
      });
    }
  }
}
