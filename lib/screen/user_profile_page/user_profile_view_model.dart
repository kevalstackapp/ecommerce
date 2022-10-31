import 'package:ecommerce/common/app/shred_preference.dart';
import 'package:ecommerce/model/get_profile_model.dart';
import 'package:ecommerce/rest_api/rest_services.dart';
import 'package:ecommerce/screen/user_profile_page/user_profile_page.dart';

class UserProfileViewModel {
  UserProfilePageState? userProfilePageState;

  UserProfileViewModel(this.userProfilePageState) {
    getProfileMethod();
  }

  ShredPreference shredPreference = ShredPreference();
  String token = "";
  bool status = false;
  GetProfileModel? getProfileModel;

  Future<GetProfileModel?> getProfileMethod() async {
    token = (await shredPreference.getPrefStringValue(shredPreference.store))!;
    String? getProfileUserRespone = await RestServices.getRestMethods(
        endpoints: RestServices.getProfileApi,
        headers: {'Authorization': 'Bearer $token'});
    log("token-->$token");
    if (getProfileUserRespone != null && getProfileUserRespone.isNotEmpty) {
      getProfileModel = getProfileModelFromJson(getProfileUserRespone);
      if (getProfileModel!.success == true) {
        userProfilePageState!.setState(() {});
      } else {
      }
    }
    return null;
  }
}

