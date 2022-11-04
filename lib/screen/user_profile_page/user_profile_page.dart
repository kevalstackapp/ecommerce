import 'package:ecommerce/common/app/shred_preference.dart';
import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_navigator.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:ecommerce/model/get_profile_model.dart';
import 'package:ecommerce/screen/user_profile_page/post_view_data/post_view_data.dart';
import 'package:ecommerce/screen/user_profile_page/user_edit_page/user_edit_page.dart';
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
  ShredPreference shredPreference = ShredPreference();
  bool isLoading = false;
  bool dataLoading = false;



  @override
  Widget build(BuildContext context) {
    userProfileViewModel ??
        (userProfileViewModel = (UserProfileViewModel(this)));

    GetProfileModel? data = userProfileViewModel!.getProfileModel;


    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: ColorResource.green,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white),
    );

    return Scaffold(
      backgroundColor: ColorResource.white,
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
          ? Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: ColorResource.green,
                ),
                ListView(children: [
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
                                horizontal: 15, vertical: 20),
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
                                child: isLoading == false
                                    ? Column(children: [
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
                                          child: Image.asset(
                                              ImageResources.phone,
                                              fit: BoxFit.fill,
                                              scale: 1),
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
                                          child: Image.asset(
                                              ImageResources.cameraProfile),
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
                                          child: Image.asset(
                                              ImageResources.groupChat),
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
                                          child: Image.asset(
                                              ImageResources.groupDollar),
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
                                        ),
                                      ])
                                    : Column(
                                        children: [
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const ClampingScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              var showData = userProfileViewModel!.getPostAdModelData!
                                                  .filteredAddList![index];
                                              return Card(
                                                margin: const EdgeInsets.only(
                                                    top: 18,
                                                    left: 15,
                                                    right: 15),
                                                elevation: 1.5,
                                                child: InkWell(onTap: () {
                                                  Navigator.push(context, CommonNavigator(child:PostViewData(showData)));
                                                },
                                                  child: Container(
                                                    height: 91,
                                                    decoration:
                                                        const BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius
                                                                        .circular(
                                                                            5))),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 10),
                                                          child: Container(
                                                            height: 64,
                                                            width: 67,
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                        .grey,
                                                                    image: showData
                                                                            .adImageThumb!
                                                                            .isNotEmpty
                                                                        ? DecorationImage(
                                                                            image: NetworkImage(
                                                                                "${showData.adImageThumb}"),
                                                                            fit: BoxFit
                                                                                .fill)
                                                                        : DecorationImage(
                                                                            image:
                                                                                NetworkImage("${showData.adVideoThumb}"),
                                                                            fit: BoxFit
                                                                                .fill,
                                                                          ),
                                                                    borderRadius: const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            5))),
                                                          ),
                                                        ),
                                                        Column(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 13.5),
                                                              child: SizedBox(
                                                                width: 100,
                                                                child: CommonText(
                                                                  text:
                                                                      "${showData.title}",
                                                                  color:
                                                                      ColorResource
                                                                          .black,
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 3),
                                                              child: SizedBox(
                                                                width: 100,
                                                                child: CommonText(
                                                                  text:
                                                                      "Rs.${showData.amount}",
                                                                  color:
                                                                      ColorResource
                                                                          .black,
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 3),
                                                              child: SizedBox(
                                                                width: 100,
                                                                child: CommonText(
                                                                  text:
                                                                      "${showData.fullAddress}",
                                                                  color:
                                                                      ColorResource
                                                                          .black,
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const Spacer(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 10),
                                                          child: Container(
                                                            height: 27,
                                                            alignment:
                                                                Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Colors.grey
                                                                    .shade400,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6)),
                                                            child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                width: 90,
                                                                child: SvgPicture
                                                                    .asset(
                                                                  ImageResources
                                                                      .share,
                                                                  height: 40,
                                                                )),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            itemCount:userProfileViewModel!.getPostAdModelData!
                                                .filteredAddList!.length,
                                          ),
                                          dataLoading
                                              ? const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: ColorResource.green,
                                                  ),
                                                )
                                              : TextButton(
                                                  onPressed: () {
                                                    dataLoading = true;
                                                    setState(() {});
                                                    userProfileViewModel!
                                                            .pageNo =
                                                        userProfileViewModel!
                                                                .pageNo +
                                                            10;
                                                    userProfileViewModel!
                                                        .getPostAdDetailsMethod()
                                                        .then((value) {
                                                      dataLoading = false;
                                                    });
                                                  },
                                                  child: const CommonText(
                                                    text:
                                                        StringResources.viewAll,
                                                    fontSize: 14,
                                                    color: ColorResource.green,
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                          const SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),
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
                                      image: NetworkImage("${data.imagePath}"),
                                      fit: BoxFit.fill)
                                  : const DecorationImage(
                                      image:
                                          AssetImage(ImageResources.userImage),
                                    )),
                        ),
                      ),
                    ],
                  ),
                ]),
              ],
            )
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
