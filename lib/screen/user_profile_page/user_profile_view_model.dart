import 'dart:io';
import 'package:ecommerce/common/app/shred_preference.dart';
import 'package:ecommerce/common/widget/snack_bar_widget.dart';
import 'package:ecommerce/model/get_post_ad_data_model.dart';
import 'package:ecommerce/model/get_profile_model.dart';
import 'package:ecommerce/rest_api/rest_services.dart';
import 'package:ecommerce/screen/user_profile_page/user_profile_page.dart';

class UserProfileViewModel {
  UserProfilePageState? userProfilePageState;

  UserProfileViewModel(this.userProfilePageState) {
    getProfileMethod();
    getPostAdDetailsMethod();
  }

  ShredPreference shredPreference = ShredPreference();
  String token = "";
  bool status = false;
  GetProfileModel? getProfileModel;
  GetPostAdDataModel? getPostAdModelData;
  int pageNo = 10;
  List postData = [];

  Future<GetProfileModel?> getProfileMethod() async {
    try {
      token =
          (await shredPreference.getPrefStringValue(shredPreference.store))!;
      String? getProfileUserResponse = await RestServices.getRestMethods(
          endpoints: RestServices.getProfileApi,
          headers: {'Authorization': 'Bearer $token'});
      log("token-->$token");
      if (getProfileUserResponse != null && getProfileUserResponse.isNotEmpty) {
        getProfileModel = getProfileModelFromJson(getProfileUserResponse);
        if (getProfileModel!.success == true) {
          userProfilePageState!.setState(() {});
        } else {}
      }
    } on SocketException catch (e) {
      log("Catch socket in updateProfile --> ${e.message}");
      userProfilePageState!.setState(() {
        status = false;
      });
    }
    return null;
  }

   getPostAdDetailsMethod() async {
    token = (await shredPreference.getPrefStringValue(shredPreference.store))!;

    try {
      userProfilePageState!.setState(() {
        status = true;
      });

      Map<String, dynamic> getPostAdDataModel = {
        "pageNo": 1,
        "pageSize": pageNo,
        "filterId": 1
      };

      String? getPostAdDataResponse =
          await RestServices.postRestMethodsWithHeaders(
        endpoints: RestServices.postAdDetailGetDataApi,
        bodyParam: getPostAdDataModel,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );

      if (getPostAdDataResponse != null && getPostAdDataResponse.isNotEmpty) {
        getPostAdModelData = getPostAdDataModelFromJson(getPostAdDataResponse);

        if (getPostAdModelData!.success == true) {
          if (userProfilePageState!.mounted) {
            userProfilePageState!.isLoading = true;
            userProfilePageState!.setState(() {});
          }
        } else {
          status = false;
          userProfilePageState!.setState(() {
            appSnackBar(userProfilePageState!.context,
                text: "${getPostAdModelData!.message}");
          });
        }
      }
    } on SocketException catch (e) {
      log("Catch socket in updateProfile --> ${e.message}");
      userProfilePageState!.setState(() {
        status = false;
      });
    }
  }
}
