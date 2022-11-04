import 'dart:io';

import 'package:ecommerce/common/app/shred_preference.dart';
import 'package:ecommerce/model/broad_cast_model.dart';
import 'package:ecommerce/rest_api/rest_services.dart';
import 'package:ecommerce/screen/user_profile_page/post_view_data/post_view_data.dart';

class PostViewDataViewModel {
  PostViewDataState postViewDataState;

  PostViewDataViewModel(this.postViewDataState){
    getBroadCastMethod();
  }

  ShredPreference shredPreference = ShredPreference();
  String token = "";
  BroadCastModel? broadCastModel;
  bool status = false;
  List<String> allVideoAndImage = [];





  getBroadCastMethod() async {
    try {
      token =
          (await shredPreference.getPrefStringValue(shredPreference.store))!;

      postViewDataState.setState(() {
        status = true;
      });

      String? getBroadCastResponse = await RestServices.getRestMethods(
          endpoints:
              "${RestServices.broadCastApi}${postViewDataState.widget.showData!.broadCastId}&res=true",
          headers: {'Authorization': 'Bearer $token'});
      log('token-->$token');
      if (getBroadCastResponse != null && getBroadCastResponse.isNotEmpty) {
        broadCastModel = broadCastModelFromJson(getBroadCastResponse);

        if (broadCastModel!.success == true) {
          postViewDataState.setState(() {

            status=false;

            for(int i =0; i<broadCastModel!.adVideo!.length;i++){
              allVideoAndImage.add("${broadCastModel!.adVideo![i].videoThumb}");
              log("Video Link ===> ${broadCastModel!.adVideo![i].videoThumb}");

            }

            for(int i =0; i<broadCastModel!.adImage!.length;i++){
              allVideoAndImage.add("${broadCastModel!.adImage![i].image}");
              print("Image Link ===> ${broadCastModel!.adImage![i].image}");

            }

          });
        }
      }
      else{
        postViewDataState.setState(() {
          status = false;
        });
      }
    } on SocketException catch (e) {
      log("Catch Socket in broadCast-->${e.message}");
      postViewDataState.setState(() {
        status = false;
      });
    }
  }
}
