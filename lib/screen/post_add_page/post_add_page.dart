import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:ecommerce/common/widget/elevated_button.dart';
import 'package:ecommerce/screen/post_add_page/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostAddPage extends StatefulWidget {
  const PostAddPage({Key? key}) : super(key: key);

  @override
  State<PostAddPage> createState() => _PostAddPageState();
}

class _PostAddPageState extends State<PostAddPage> {
  @override
  Widget build(BuildContext context) {
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
                    width: 50,
                  ),
                  const CommonText(
                    text: StringResources.notifications,
                    color: ColorResource.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )
                ],
              )),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: ColorResource.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
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
                      InkWell(
                        onTap: () async {
                          PostAddPageWidget()
                              .showModelButtomsSheetVideo(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                      InkWell(
                        onTap: () async {
                          PostAddPageWidget()
                              .showModelButtomsSheetPhoto(context);
                          PostAddPageWidget().requestCameraPermission();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                onPressed: () {},
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
                  setState(() {});
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
