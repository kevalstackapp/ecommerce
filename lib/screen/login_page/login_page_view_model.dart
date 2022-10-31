import 'dart:convert';
import 'dart:io';
import 'package:ecommerce/common/widget/snack_bar_widget.dart';
import 'package:ecommerce/model/login_model.dart';
import 'package:ecommerce/screen/home_page/home_page.dart';
import 'package:ecommerce/screen/navigator_all_page/navigator_all_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ecommerce/common/app/shred_preference.dart';
import 'package:ecommerce/common/widget/common_navigator.dart';
import 'package:ecommerce/rest_api/rest_services.dart';
import 'package:ecommerce/screen/login_page/login_page.dart';
import 'package:flutter/material.dart';

class LoginPageViewModel {
  final LoginPageState loginPageState;

  LoginPageViewModel(this.loginPageState);

  ShredPreference shredPreference = ShredPreference();

  Future<void> loginUPMethod(
    BuildContext context,
    TextEditingController email,
    TextEditingController password,
    bool status,
  ) async {
    try {
      loginPageState.setState(() {
        status = true;
      });
      Map<String, dynamic> loginMap = {
        'devicetoken': await FirebaseMessaging.instance.getToken(),
        'devicetype': "2",
        'email': email.text.trim(),
        'password': password.text.trim(),
        'userName': "",
        'facebookProfileUrl': "",
        "mobileVersion": Platform.isAndroid ? 'Android' : 'IOS',
        "osVersion": "10.11"
      };
      log('LoginMap --> $loginMap');
      String? loginUserResponse = await RestServices.postRestMethods(
          endpoints: RestServices.loginApi, bodyParam: loginMap);

      if (loginUserResponse != null && loginUserResponse.isNotEmpty) {
        Map<String, dynamic> loginUserResponseMap =
            jsonDecode(loginUserResponse);
        if (loginUserResponseMap.containsKey('Success') &&
            loginUserResponseMap['Success']) {
          LoginModel loginModel = loginModelFromJson(loginUserResponse);
          log('Loginmmodel --> ${loginModel.toJson()}');

          await shredPreference.setPrefStringValue(
              shredPreference.store, "${loginUserResponseMap['access_token']}");
          shredPreference.setPrefBoolValue(shredPreference.isLogin, true);

          if(loginPageState.mounted){
            appSnackBar(context, text: "${loginUserResponseMap['Message']}");
            Navigator.pushAndRemoveUntil(
              context,
              CommonNavigator(child: const NavigatorAllPage()),
                  (route) => false,
            );
          }

        } else {
          loginPageState.status = false;
          loginPageState.setState(() {
            appSnackBar(context, text: "${loginUserResponseMap['Message']}");
          });
        }
      }
    } on SocketException catch (e) {
      log("Catch socket in loginUPMethod --> ${e.message}");
      log(e.message);
      loginPageState.setState(() {
        status = false;
      });
    }
  }
}

