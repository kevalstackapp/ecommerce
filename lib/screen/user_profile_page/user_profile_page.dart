import 'package:ecommerce/common/app/shred_preference.dart';
import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_navigator.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:ecommerce/model/get_profile_model.dart';
import 'package:ecommerce/screen/user_profile_page/user_edit_page/user_edit_page.dart';
import 'package:ecommerce/screen/user_profile_page/user_edit_page/user_edit_view_model.dart';
import 'package:ecommerce/screen/user_profile_page/user_profile_view_model.dart';
import 'package:ecommerce/screen/user_profile_page/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfilePage extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const UserProfilePage({
    super.key,
    this.scaffoldKey,
  });

  @override
  State<UserProfilePage> createState() => UserProfilePageState();
}

class UserProfilePageState extends State<UserProfilePage> {
  UserProfileViewModel? userProfileViewModel;
  UserEditViewModel? userEditViewModel;
  ShredPreference shredPreference = ShredPreference();

  @override
  Widget build(BuildContext context) {
    userProfileViewModel ??
        (userProfileViewModel = (UserProfileViewModel(this)));

    GetProfileModel? data = userProfileViewModel!.getProfileModel;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorResource.green,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: ColorResource.green,
      resizeToAvoidBottomInset: false,
      appBar: data != null
          ? PreferredSize(
              preferredSize:
                  const Size.fromHeight(70), // here the desired height
              child: AppBar(
                backgroundColor: ColorResource.green,
                elevation: 0,
                leading: InkWell(
                  onTap: () {
                    widget.scaffoldKey!.currentState!.openDrawer();
                    setState(() {});
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 30,
                      width: 30,
                      child: SvgPicture.asset(
                        ImageResources.drawerimg,
                      )),
                ),
                title: const CommonText(
                  text: StringResources.profile,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: ColorResource.white,
                ),
                centerTitle: true,
                actions: [
                  InkWell(
                    onTap: () async {
                      Navigator.push(
                          context,
                          CommonNavigator(
                              child: UserEditPage(
                                  userProfileViewModel!.getProfileModel)));
                    },
                    child: SvgPicture.asset(
                      ImageResources.editWhiteIcon,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () async {
                      showModelButtomsSheetPassword(context);
                      await shredPreference.setPrefStringValue(
                          shredPreference.userId, "${data.userId}");
                    },
                    child: SvgPicture.asset(
                      ImageResources.menu,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
            )
          : null,
      body: data != null
          ? ListView(children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: ColorResource.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: Column(children: [
                      const SizedBox(
                        height: 50,
                      ),
                      data == null
                          ? const Text("")
                          : Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "${data.userName}",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: CommonText(
                          text: StringResources.owner,
                          color: ColorResource.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              ImageResources.location,
                              height: 11,
                            ),
                            const CommonText(
                              text: StringResources.californiauSA,
                              fontSize: 12,
                              color: ColorResource.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CommonText(
                        text: StringResources.videoStorage,
                        fontSize: 16,
                        color: ColorResource.black,
                        fontWeight: FontWeight.w500,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 25),
                        child: Row(
                          children: const [
                            CommonText(
                              text: StringResources.myAds,
                              fontSize: 16,
                              color: ColorResource.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Card(
                            child: Column(children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: CommonText(
                                  text: StringResources.postSomeThing,
                                  fontSize: 16,
                                  color: ColorResource.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 75,
                                width: 75,
                                child: Image.asset(ImageResources.phone,
                                    fit: BoxFit.fill, scale: 1),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: CommonText(
                                  text: StringResources.profileText1,
                                  fontSize: 14,
                                  color: ColorResource.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                width: 200,
                                child:
                                    Image.asset(ImageResources.cameraProfile),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: CommonText(
                                  text: StringResources.profileText2,
                                  fontSize: 14,
                                  color: ColorResource.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                width: 200,
                                child: Image.asset(ImageResources.groupChat),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: CommonText(
                                  text: StringResources.profileText3,
                                  fontSize: 14,
                                  color: ColorResource.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                width: 200,
                                child: Image.asset(ImageResources.groupDollar),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: CommonText(
                                  text: StringResources.profileText4,
                                  fontSize: 14,
                                  color: ColorResource.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ]),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: ColorResource.white,
                          ),
                          color: ColorResource.grey,
                          image: data.imagePath != null
                              ? DecorationImage(
                                  image: NetworkImage("${data.imagePath}"),fit: BoxFit.fill)
                              : const DecorationImage(
                                  image: AssetImage(ImageResources.userImage),
                                )),
                    ),
                  ),
                ],
              ),
            ])
          : Container(
              height: double.infinity,
              width: double.infinity,
              color: ColorResource.white,
              child: const Center(
                child: SizedBox(
                    height: 40, width: 40, child: CircularProgressIndicator()),
              ),
            ),
    );
  }
}
