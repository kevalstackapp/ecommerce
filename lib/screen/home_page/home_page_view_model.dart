import 'dart:io';
import 'package:ecommerce/common/app/shred_preference.dart';
import 'package:ecommerce/common/widget/snack_bar_widget.dart';
import 'package:ecommerce/model/get_filter_ads.dart';
import 'package:ecommerce/rest_api/rest_services.dart';
import 'package:ecommerce/screen/home_page/home_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomePageViewModel {
  HomePageState homePageState;

  HomePageViewModel(this.homePageState) {
    getFilterAdsMethod();
  }

  ShredPreference shredPreference = ShredPreference();
  String token = "";
  bool status = false;
  int pageNo = 10;
  GetFilterAds? getFilterAds;

  Future<void> getFilterAdsMethod() async {
    try {
      // homePageState.setState(() {
      //   status = true;
      // });

      Map<String, dynamic> getFilterAdsModel = {
        "CategoryId": null,
        "Distance": 0,
        "FilterId": 1,
        "Latitude": 37.0902,
        "Longitude": 95.7129,
        "SearchText": "",
        "SuSubCategoryList": [],
        "SubCategoryList": [],
        "deviceToken": await FirebaseMessaging.instance.getToken(),
        "pageNo": 1,
        "pageSize": pageNo,
        "versionCode": "1.27",
        "mobileVersion": "Samsung galaxy j7 max (Android ver.-8.1.0)",
        "osVersion": "8.12",
        "countryId": "United States",
        "isRequestFromWeb": true
      };

      String? getFilterAdsResponse =
          await RestServices.postRestMethodsWithHeaders(
              endpoints: RestServices.getFilterAdsApi,
              bodyParam: getFilterAdsModel,
              headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });

      if (getFilterAdsResponse != null && getFilterAdsResponse.isNotEmpty) {
        getFilterAds = getFilterAdsFromJson(getFilterAdsResponse);
        if (getFilterAds!.success == true && homePageState.mounted) {
          homePageState.setState(() {
            status = false;
          });
        } else {
          status = false;
          homePageState.setState(() {
            appSnackBar(homePageState.context,
                text: "${getFilterAds!.message}");
          });
        }
      }
    } on SocketException catch (e) {
      log("Catch socket in getFilterAds  --> ${e.message}");
      homePageState.setState(() {
        status = false;
      });
    }
  }
}


// onEndOfPage: () {
// dataLoading = true;
// setState(() {});
//
// homePageViewModel!.pageNo =
// homePageViewModel!.pageNo + 10;
//
// homePageViewModel!.getFilterAdsMethod().then(
// (value) {
// dataLoading = false;
// },
// );
// },




// Row(
//   children: [
//     const Padding(
//         padding: EdgeInsets.only(left: 20),
//         child: CommonText(
//           text: StringResources.topads,
//           fontSize: 18,
//           fontWeight: FontWeight.w400,
//         )),
//     const Padding(
//         padding: EdgeInsets.only(left: 200),
//         child: CommonText(
//           text: StringResources.seeall,
//           fontSize: 14,
//           color: ColorResource.green,
//           fontWeight: FontWeight.w500,
//         )),
//     Padding(
//       padding: const EdgeInsets.only(left: 5),
//       child: SvgPicture.asset(
//         ImageResources.backarow,
//         color: ColorResource.green,
//       ),
//     ),
//   ],
// ),
// SizedBox(
//   height: 193,
//   child: ListView.builder(
//     itemCount: 4,
//     scrollDirection: Axis.horizontal,
//     itemBuilder: (context, index) {
//       return Card(
//         child: Column(
//           children: [
//             Container(
//               alignment: Alignment.topRight,
//               height: 90,
//               width: 140,
//               margin: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                   color: Colors.grey,
//                   image: DecorationImage(
//                       image: AssetImage(adsimg[index]),
//                       fit: BoxFit.fill),
//                   borderRadius: const BorderRadius.all(
//                       Radius.circular(10))),
//               child: SvgPicture.asset(
//                 ImageResources.likeicon,
//               ),
//             ),
//             Row(
//               mainAxisAlignment:
//                   MainAxisAlignment.spaceBetween,
//               children: [
//                 CommonText(
//                     text: modelname[index],
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14),
//                 const SizedBox(
//                   width: 4,
//                 ),
//                 CommonText(
//                     text: prizename[index],
//                     fontWeight: FontWeight.w500,
//                     color: ColorResource.green,
//                     fontSize: 10),
//               ],
//             ),
//             Row(
//               mainAxisAlignment:
//                   MainAxisAlignment.spaceBetween,
//               children: [
//                 SvgPicture.asset(
//                   ImageResources.location,
//                   height: 11,
//                 ),
//                 CommonText(
//                   text: locationname1[index],
//                   fontSize: 10,
//                   color: ColorResource.grey,
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Row(
//               children: [
//                 Container(
//                   height: 27,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       color: ColorResource.green,
//                       borderRadius:
//                           BorderRadius.circular(6)),
//                   child: Container(
//                       alignment: Alignment.center,
//                       width: 76,
//                       child: SvgPicture.asset(
//                         ImageResources.share,
//                         height: 40,
//                       )),
//                 ),
//                 const SizedBox(
//                   width: 30,
//                 ),
//                 SvgPicture.asset(
//                   ImageResources.trophyicon,
//                   height: 27,
//                 )
//               ],
//             ),
//           ],
//         ),
//       );
//     },
//   ),
// ),