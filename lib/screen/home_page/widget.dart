import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_listtile.dart';
import 'package:ecommerce/common/widget/common_navigator.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:ecommerce/common/widget/elevated_button.dart';
import 'package:ecommerce/screen/home_page/home_page.dart';
import 'package:ecommerce/screen/like_page/like_page.dart';
import 'package:ecommerce/screen/location_page/category_page/category_page.dart';
import 'package:ecommerce/screen/login_page/login_page.dart';
import 'package:ecommerce/screen/message_page/message_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> name = [
  (StringResources.hotel),
  (StringResources.car),
  (StringResources.smartphone),
  (StringResources.more)
];

List<String> img = [
  (ImageResources.hotel),
  (ImageResources.car),
  (ImageResources.smartphone),
  (ImageResources.category)
];

List<String> adsimg = [
  (ImageResources.carimag),
  (ImageResources.comimg),
  (ImageResources.carimag),
  (ImageResources.comimg)
];

List<String> prizename = [
  (StringResources.prize),
  (StringResources.prize2),
  (StringResources.prize),
  (StringResources.prize2)
];

List<String> modelname = [
  (StringResources.bmw2021),
  (StringResources.imaccomputer),
  (StringResources.bmw2021),
  (StringResources.imaccomputer)
];

List<String> gridimg = [
  (ImageResources.grid1pic),
  (ImageResources.grid2pic),
  (ImageResources.grid3pic),
  (ImageResources.grid4pic)
];

List<String> gridname = [
  (StringResources.canonlens),
  (StringResources.microwave),
  (StringResources.wallet),
  (StringResources.ring)
];

List<String> locationname1 = [
  (StringResources.californiauSA),
  (StringResources.hawaihanamulu),
  (StringResources.californiauSA),
  (StringResources.hawaihanamulu)
];

List<String> locationname2 = [
  (StringResources.alaska),
  (StringResources.kolkataindia),
  (StringResources.alaska),
  (StringResources.kolkataindia)
];

List<String> iconimg = [
  (ImageResources.home),
  (ImageResources.heart),
  (ImageResources.message),
  (ImageResources.usericon)
];


Future<void> showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: Image.asset(ImageResources.alertdialogimg),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Center(
                child: Text(
                  StringResources.welcome,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  )),
                ),
              ),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  StringResources.alertdilogdocuments,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const CommonElevatedButton(
                margin: 10,
                text: StringResources.alertdilogfirstbutton,
                textSize: 14,
                buttonColor: ColorResource.green,
              ),
              const SizedBox(
                height: 15,
              ),
              CommonElevatedButton(
                onPressed: () {
                  return Navigator.pop(context);
                },
                margin: 10,
                text: StringResources.alertdilogsecondbutton,
                textSize: 14,
                buttonColor: ColorResource.black,
              ),
            ],
          ),
        ),
      );
    },
  );
}

draweropen(BuildContext context) {
  return Drawer(

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(60), bottomRight: Radius.circular(60)),
      ),
      child: ListView(children: [
        Container(
            height: 125,
            color: ColorResource.green,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: SvgPicture.asset(
                      ImageResources.userlogo,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context, CommonNavigator(child: const LoginPage()));
                  },
                  child: const CommonText(
                      text: StringResources.drawername,
                      fontSize: 14,
                      color: ColorResource.white,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 5),
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset(
                      ImageResources.arrowicon,
                    ),
                  ),
                ),
              ],
            )),
        const SizedBox(
          height: 15,
        ),
        const CommonListTile(
          text: ImageResources.camera,
          titletext: StringResources.camera,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          imgtext: ImageResources.backarow,
        ),
        CommonListTile(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context, CommonNavigator(child: const CategoryPage()));
          },
          text: ImageResources.category,
          titletext: StringResources.categories,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          imgtext: ImageResources.backarow,
        ),
        const CommonListTile(
          text: ImageResources.ads,
          titletext: StringResources.ads,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          imgtext: ImageResources.backarow,
        ),
        const CommonListTile(
          text: ImageResources.space,
          titletext: StringResources.space,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          imgtext: ImageResources.backarow,
        ),
        CommonListTile(
          onTap: () {},
          text: ImageResources.user,
          titletext: StringResources.user,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          imgtext: ImageResources.backarow,
        ),
        const CommonListTile(
          text: ImageResources.help,
          titletext: StringResources.help,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          imgtext: ImageResources.backarow,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60, right: 170),
          child: SizedBox(
              height: 56,
              width: 86,
              child: Image.asset(ImageResources.splashscrrenLogo)),
        ),
      ]));
}
