import 'dart:convert';
import 'package:ecommerce/common/app/shred_preference.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_navigator.dart';
import 'package:ecommerce/common/widget/common_text_field.dart';
import 'package:ecommerce/common/widget/snack_bar_widget.dart';
import 'package:ecommerce/rest_api/rest_services.dart';
import 'package:ecommerce/screen/navigator_all_page/navigator_all_page.dart';
import 'package:ecommerce/screen/post_add_page/post_ad_details_page/post_ad_details_page.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PostAdDetailViewModel {
  final PostAdDetailsPageState postAdDetailsPageState;

  PostAdDetailViewModel(this.postAdDetailsPageState);

  ShredPreference shredPreference = ShredPreference();
  String token = "";
  bool status = false;


  Future<String?>? postAdDetailMethod(BuildContext context) async {
    token = (await shredPreference.getPrefStringValue(shredPreference.store))!;
    try {
      postAdDetailsPageState.setState(() {
        status = true;
      });

      http.MultipartRequest request = http.MultipartRequest(
          'POST', Uri.parse(RestServices.postAdDetailApi));
      log("bytesImagePath${request.url}");
      request.headers.addAll(
        {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'},
      );
      request.fields.addAll({
        'addDetailId': '',
        'servicePackId': '',
        'totalExposureDays': '',
        'perDayExposurePrice': '',
        'title': postAdDetailsPageState.titleController.text,
        'cityName': 'Surat',
        'stateName': 'Gujarat',
        'description': postAdDetailsPageState.descriptionController.text,
        'amount': postAdDetailsPageState.amountController.text,
        'addType': '1',
        'categoryId': '1',
        'subCategoryId': '1',
        'suSubCategoryId': '0',
        'latitude': '21.1702401',
        'longitude': '72.8310607',
        'countryId': 'india',
        'distance': '158',
        'location': 'Surat, Gujarat, India',
        'broadCastAmount': '0.0',
        'currency': 'INR',
        'videoSize': '',
        'videoDuration': '',
        'adVideoList[0].videoSize': '10',
        'adVideoList[0].videoDuration': '8'
      });

      for (var i = 0; i < postAdDetailsPageState.widget.imgPath.length; i++) {
        request.files.add(await http.MultipartFile.fromPath(
            'adImageList[0]', postAdDetailsPageState.widget.imgPath[i].path));
        log("imgPath${postAdDetailsPageState.widget.imgPath[i].path}");
      }

      for (var i = 0; i < postAdDetailsPageState.widget.videoPath.length; i++) {
        request.files.add(await http.MultipartFile.fromPath(
            'adVideoList[0].adVideo',
            postAdDetailsPageState.widget.videoPath[i]));
        log("imgPath${postAdDetailsPageState.widget.videoPath[i]}");
      }

      http.StreamedResponse response = await request.send();
      log("${response.statusCode}");
      final respStr = await response.stream.bytesToString();
      log("response==>$respStr");

      Map<String, dynamic> responseMap = jsonDecode(respStr);

      if (responseMap.containsKey('Success') && responseMap['Success']) {
        if (postAdDetailsPageState.mounted) {
          postAdDetailsPageState.setState(() {
            status = false;
          });
          appSnackBar(postAdDetailsPageState.context,
              text: '${responseMap['Message']}');
          Navigator.pushReplacement(
              context, CommonNavigator(child: const NavigatorAllPage()));
        }
      } else {
        if (postAdDetailsPageState.mounted) {
          appSnackBar(postAdDetailsPageState.context,
              text: '${responseMap['Message']}');
        }
        postAdDetailsPageState.setState(() {
          status = false;
        });
      }
    } on PlatformException catch (e) {
      log('PlatformException in postRestCall --> ${e.message}');
      postAdDetailsPageState.setState(() {
        status = false;
      });
    }
    return null;
  }

  Widget titleTextFiled() {
    return CommonTextField(
      textEditingController: postAdDetailsPageState.titleController,
      hintText: StringResources.title,
    );
  }

  Widget amountTextFiled() {
    return CommonTextField(
      textEditingController: postAdDetailsPageState.amountController,
      textInputType: TextInputType.number,
      hintText: StringResources.amount1,
    );
  }

  Widget descriptionTextFiled() {
    return CommonTextField(
      textEditingController: postAdDetailsPageState.descriptionController,
      maxLines: 6,
      hintText: StringResources.description,
    );
  }
}
