import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_listtile.dart';
import 'package:ecommerce/common/widget/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage {

}

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


draweropen() {
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
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Text(
                  StringResources.drawername,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 14,
                    color: ColorResource.white,
                    fontWeight: FontWeight.w500,
                  )),
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
        ),
        const CommonListTile(
          text: ImageResources.category,
          titletext: StringResources.categories,
        ),
        const CommonListTile(
          text: ImageResources.ads,
          titletext: StringResources.ads,
        ),
        const CommonListTile(
          text: ImageResources.space,
          titletext: StringResources.space,
        ),
        CommonListTile(
          onTap: () {},
          text: ImageResources.user,
          titletext: StringResources.user,
        ),
        const CommonListTile(
          text: ImageResources.help,
          titletext: StringResources.help,
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
