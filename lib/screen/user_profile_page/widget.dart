import 'dart:convert';
import 'dart:io';

import 'package:ecommerce/common/app/shred_preference.dart';
import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_navigator.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:ecommerce/common/widget/snack_bar_widget.dart';
import 'package:ecommerce/rest_api/rest_services.dart';
import 'package:ecommerce/screen/login_page/login_page.dart';
import 'package:ecommerce/screen/user_profile_page/change_password_page/change_password_page.dart';
import 'package:flutter/material.dart';

ShredPreference shredPreference = ShredPreference();
String userId = "";

showModelButtomsSheetPassword(BuildContext context) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(25.0),
      topRight: Radius.circular(25.0),
    )),
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return SizedBox(
            height: 146,
            child: Column(children: [
              ListTile(
                  onTap: () {
                    Navigator.pop(context);

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const CommonText(
                            text: StringResources.logoutTitle,
                            color: ColorResource.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                userId =
                                    (await shredPreference.getPrefStringValue(
                                        shredPreference.userId))!;
                                log('userId--->$userId');
                                try {
                                  String? logoutResponse = await RestServices
                                      .postRestMethodWithParameter(
                                          endPoints:
                                              RestServices.logoutApi + userId);
                                  if (logoutResponse != null &&
                                      logoutResponse.isNotEmpty) {
                                    Map<String, dynamic> logoutResponseMap =
                                        jsonDecode(logoutResponse);

                                    if (logoutResponseMap
                                            .containsKey('Success') &&
                                        logoutResponseMap['Success']) {
                                      appSnackBar(context,
                                          text:
                                              '${logoutResponseMap['Message']}');

                                      shredPreference.removePrefValue(shredPreference.isLogin);

                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          CommonNavigator(child: LoginPage()),
                                          (route) => false);
                                    } else {
                                      appSnackBar(context,
                                          text:
                                              '${logoutResponseMap['Message']}');
                                    }
                                  }
                                } on SocketException catch (e) {
                                  log("SocketException in forgotPassword${e.message}");
                                }
                              },
                              child: const CommonText(
                                text: StringResources.yes,
                                color: ColorResource.green,
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const CommonText(
                                text: StringResources.no,
                                color: ColorResource.green,
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                  title: const CommonText(
                    text: StringResources.logOut,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: ColorResource.black,
                    textAlign: TextAlign.center,
                  )),
              const Divider(),
              ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        CommonNavigator(child: const ChangePasswordPage()));
                  },
                  title: const CommonText(
                    text: StringResources.changePassword,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: ColorResource.black,
                    textAlign: TextAlign.center,
                  )),
            ]),
          );
        },
      );
    },
  );
}
