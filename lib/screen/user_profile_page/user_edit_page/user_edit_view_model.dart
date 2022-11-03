import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:ecommerce/common/app/shred_preference.dart';
import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:ecommerce/common/widget/snack_bar_widget.dart';
import 'package:ecommerce/model/update_profile_model.dart';
import 'package:ecommerce/rest_api/rest_services.dart';
import 'package:ecommerce/screen/navigator_all_page/navigator_all_page.dart';
import 'package:ecommerce/screen/user_profile_page/user_edit_page/user_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class UserEditViewModel {
  UserEditPageState? userEditPageState;

  UserEditViewModel(this.userEditPageState);

  ShredPreference shredPreference = ShredPreference();
  String token = "";

  updateProfileMethod(
      BuildContext context,
      TextEditingController firstNameController,
      TextEditingController lastNameController,
      TextEditingController addressController,
      TextEditingController emailController,
      TextEditingController websiteController,
      Country selectedDialogCountry,
      TextEditingController phoneController,
      bool isSwitchOn,
      bool isSwitchOnEmail,
      String selectedItem,
      bool status) async {
    token = (await shredPreference.getPrefStringValue(shredPreference.store))!;

    try {
      userEditPageState!.setState(() {
        status = true;
      });

      UpdateProfileModel updateProfileModel = UpdateProfileModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        website: websiteController.text,
        countryCode: selectedDialogCountry.phoneCode,
        phoneNumber: phoneController.text,
        publicProfile: isSwitchOn,
        ispublicemail: isSwitchOnEmail,
        businessName: selectedItem,
        fullAddress: addressController.text,
      );
      log("updateProfileModel-->$updateProfileModel");

      String? updateProfileResponse =
          await RestServices.postRestMethodsWithHeaders(
        endpoints: RestServices.updateProfileApi,
        bodyParam: updateProfileModel.toJson(),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );

      if (updateProfileResponse != null && updateProfileResponse.isNotEmpty) {
        Map<String, dynamic> updateProfileResponseMap =
            jsonDecode(updateProfileResponse);
        if (updateProfileResponseMap.containsKey('Success') &&
            updateProfileResponseMap['Success']) {
          if (userEditPageState!.mounted) {
            appSnackBar(userEditPageState!.context,
                text: "${updateProfileResponseMap['Message']}");
            Navigator.pushAndRemoveUntil(
                userEditPageState!.context,
                MaterialPageRoute(
                    builder: (builder) => const NavigatorAllPage(
                          index: 3,
                        )),
                (route) => false);
          }
        } else {
          userEditPageState!.status = false;
          userEditPageState!.setState(() {
            appSnackBar(userEditPageState!.context,
                text: "${updateProfileResponseMap['Message']}");
          });
        }
      }
    } on SocketException catch (e) {
      log("Catch socket in updateProfile --> ${e.message}");
      userEditPageState!.setState(() {
        status = false;
      });
    }
  }

  Future<String?>? profileImageMethod() async {
    token = (await shredPreference.getPrefStringValue(shredPreference.store))!;
    try {
      http.MultipartRequest request =
          http.MultipartRequest('POST', Uri.parse(RestServices.profileImage));
      log("bytesImagePath${request.url}");
      request.headers.addAll(
        {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'},
      );
      log("bytesImagePath${userEditPageState!.bytesImgPath!.toList()}");
      request.files.add(http.MultipartFile.fromBytes(
          'file', userEditPageState!.bytesImgPath!.toList(),
          filename: userEditPageState!.imgPath));
      userEditPageState!.setState(() {});
      http.StreamedResponse r = await request.send();
      log("${r.statusCode}");
      log("reasonPhrase${r.reasonPhrase}");
    } on PlatformException catch (e) {
      log('PlatformException in postRestCall --> ${e.message}');
    }
    return null;
  }

  Widget buildDialogItem(
    Country country,
  ) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 13),
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            Flexible(
                child: Text(
              "(${country.name})+${country.phoneCode}",
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              )),
            )),
          ],
        ),
      );

  void openCountryPickerDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
          child: CountryPickerDialog(
            titlePadding: const EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: const InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: const Text('Select your phone code'),
            onValuePicked: (Country country) {
              userEditPageState!.setState(() {
                userEditPageState!.selectedDialogCountry = country;
              });
            },
            itemBuilder: buildDialogItem,
            priorityList: [
              CountryPickerUtils.getCountryByIsoCode('TR'),
              CountryPickerUtils.getCountryByIsoCode('US'),
            ],
          ),
        ),
      );

  showModelButtomsSheetPhoto(BuildContext context) {
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
              height: 220,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    ListTile(
                        onTap: () {
                          imgMethod(ImageSource.camera);
                          Navigator.pop(context);
                        },
                        title: const CommonText(
                          text: StringResources.TakePhoto,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: ColorResource.black,
                          textAlign: TextAlign.center,
                        )),
                    const Divider(),
                    ListTile(
                        onTap: () {
                          imgMethod(ImageSource.gallery);
                          Navigator.pop(context);
                        },
                        title: const CommonText(
                          text: StringResources.Choosefromlibrary,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: ColorResource.black,
                          textAlign: TextAlign.center,
                        )),
                    const Divider(),
                    ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: const CommonText(
                          text: StringResources.Cancel,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: ColorResource.red,
                          textAlign: TextAlign.center,
                        )),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  imgMethod(ImageSource imageSource)async {
    try {
      XFile? image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      userEditPageState!.imgPath = image.path;
      userEditPageState!.bytesImgPath = await image.readAsBytes();
      await profileImageMethod();
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    }
  }
}

// Today I have work to post Add Page  Ad With Image/video Api integration.user Profile page in PostAds data get but data display not complete.
