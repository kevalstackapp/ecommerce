import 'dart:io';
import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_navigator.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:ecommerce/common/widget/elevated_button.dart';
import 'package:ecommerce/screen/post_add_page/post_ad_details_page/post_ad_details_page.dart';
import 'package:ecommerce/screen/post_add_page/storage_page/storage_page.dart';
import 'package:ecommerce/screen/post_add_page/post_add_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class PostAddPage extends StatefulWidget {
  const PostAddPage( {Key? key}) : super(key: key);

  @override
  State<PostAddPage> createState() => PostAddPageState();
}

class PostAddPageState extends State<PostAddPage> {
  PostAddPageViewModel? postAddPageViewModel;
  List<XFile> imgPath = [];
  Uint8List? bytesImgPath;
  late VideoPlayerController controller;

  List<String> videoPath = [];

  @override
  Widget build(BuildContext context) {
    postAddPageViewModel ?? (postAddPageViewModel = PostAddPageViewModel(this));
    return Scaffold(
      backgroundColor: ColorResource.green,
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: SizedBox(
              height: 30,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: ColorResource.white,
                      )),
                  const SizedBox(
                    width: 60,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: CommonText(
                      text: StringResources.PostyourAd,
                      color: ColorResource.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  )
                ],
              )),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
                color: ColorResource.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )),
            child: ListView(children: [
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                elevation: 3,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: const CommonText(
                          text: StringResources.Media,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ColorResource.black,
                        ),
                        trailing:
                            SvgPicture.asset(ImageResources.infomationicon),
                      ),
                      const Divider(),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: CommonText(
                          text: StringResources.videotext1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ColorResource.black,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: CommonText(
                          text: StringResources.videorext2,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: ColorResource.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                postAddPageViewModel!
                                    .showModelButtomsSheetVideo(
                                  context,
                                );
                              },
                              child: SizedBox(
                                height: 109,
                                width: 113,
                                child: Stack(children: [
                                  SvgPicture.asset(ImageResources.videoicon),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 19, top: 62),
                                    child: CommonText(
                                      text: StringResources.AddVideos,
                                      color: ColorResource.green,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 100,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: videoPath.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Stack(children: [
                                          FutureBuilder<String?>(
                                            future: postAddPageViewModel!
                                                .videoThumbnail(index),
                                            builder: (context, snapshot) {
                                              if (snapshot.data != null &&
                                                  snapshot.hasData) {
                                                return InkWell(
                                                  onTap: () {
                                                    // Navigator.push(
                                                    //     context,
                                                    //     CommonNavigator(
                                                    //         child: AppVideoPlayer(
                                                    //             videoPath[
                                                    //                 index])));
                                                  },
                                                  child: Container(
                                                      height: 109,
                                                      width: 113,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          8)),
                                                          image:
                                                              DecorationImage(
                                                                  image:
                                                                      FileImage(
                                                                    File(snapshot
                                                                        .data!),
                                                                  ),
                                                                  fit: BoxFit
                                                                      .fill)),
                                                      child: const Icon(
                                                        Icons.play_circle,
                                                        color:
                                                            ColorResource.green,
                                                      )),
                                                );
                                              } else {
                                                return const CircularProgressIndicator();
                                              }
                                            },
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  videoPath.removeAt(index);
                                                });
                                              },
                                              icon: SvgPicture.asset(
                                                  ImageResources.removeicon))
                                        ]),
                                        const SizedBox(
                                          width: 5,
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ]),
              ),
              const SizedBox(
                height: 25,
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                elevation: 3,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: CommonText(
                          text: StringResources.imagetext1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ColorResource.black,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: CommonText(
                          text: StringResources.imagetext2,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: ColorResource.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  postAddPageViewModel!
                                      .showModelButtomsSheetPhoto(context);
                                });
                                postAddPageViewModel!.requestCameraPermission();
                              },
                              child: SizedBox(
                                height: 109,
                                width: 113,
                                child: Stack(children: [
                                  SvgPicture.asset(ImageResources.imageicon),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 19, top: 62),
                                    child: CommonText(
                                      text: StringResources.AddPhotos,
                                      color: ColorResource.green,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 109,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: imgPath.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        alignment: Alignment.topRight,
                                        height: 109,
                                        width: 113,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5)),
                                            image: DecorationImage(
                                                image: FileImage(
                                                    File(imgPath[index].path)),
                                                fit: BoxFit.fill)),
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                imgPath.removeAt(index);
                                              });
                                            },
                                            icon: SvgPicture.asset(
                                                ImageResources.removeicon)));
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ]),
              ),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CommonText(
                  text: StringResources.posttext,
                  color: ColorResource.black,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context, CommonNavigator(child: const StoragePage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CommonText(
                      text: StringResources.Gotomyoptions,
                      fontSize: 13,
                      color: ColorResource.green,
                      fontWeight: FontWeight.w500,
                    ),
                    SvgPicture.asset(
                      ImageResources.ArrowRight,
                      height: 9,
                      width: 8,
                    ),
                  ],
                ),
              ),
              CommonElevatedButton(
                onPressed: () {
                  if (videoPath.isEmpty && imgPath.isEmpty) {
                    Fluttertoast.showToast(
                        msg: StringResources.postToast,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: ColorResource.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    Navigator.push(context,
                        CommonNavigator(child:  PostAdDetailsPage(imgPath,videoPath)));
                    setState(() {});
                  }
                },
                buttonColor: ColorResource.green,
                textSize: 16,
                text: StringResources.Next,
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}

