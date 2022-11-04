import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_navigator.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:ecommerce/model/get_post_ad_data_model.dart' as model;
import 'package:ecommerce/screen/navigator_all_page/navigator_all_page.dart';
import 'package:ecommerce/screen/user_profile_page/post_view_data/post_view_data_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostViewData extends StatefulWidget {
  model.FilteredAddList? showData;

  PostViewData(this.showData, {super.key});

  @override
  State<PostViewData> createState() => PostViewDataState();
}

class PostViewDataState extends State<PostViewData> {
  PostViewDataViewModel? postViewDataViewModel;

  @override
  Widget build(BuildContext context) {
    postViewDataViewModel ??
        (postViewDataViewModel = (PostViewDataViewModel(this)));

    var getData = postViewDataViewModel!.broadCastModel;

    return Scaffold(
        backgroundColor: ColorResource.white,
        body: Stack(
          children: [
            getData != null
                ? Stack(
                    children: [
                      ListView(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 200,
                                width: double.infinity,
                                color: ColorResource.green,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: const BoxDecoration(
                                            color: Colors.grey,
                                            shape: BoxShape.circle),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.share,
                                              color: ColorResource.white,
                                              size: 15),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Container(
                                          height: 35,
                                          width: 35,
                                          decoration: const BoxDecoration(
                                              color: Colors.grey,
                                              shape: BoxShape.circle),
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.more_horiz,
                                                color: ColorResource.white,
                                                size: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 170),
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    color: ColorResource.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    )),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: CommonText(
                                              text: "${getData.title}",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                              color: ColorResource.black,
                                            ),
                                          ),
                                          const Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15),
                                            child: CommonText(
                                              text: "\$${getData.amount}",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                              color: ColorResource.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            ImageResources.location,
                                            height: 11,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          CommonText(
                                            text: "${getData.location}",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ColorResource.grey,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, top: 10),
                                          child: CommonText(
                                            text: StringResources.images,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ColorResource.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              height: 75,
                                              child: ListView.separated(
                                                separatorBuilder:
                                                    (context, index) {
                                                  return const SizedBox(
                                                    width: 8,
                                                  );
                                                },
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    getData.adImage!.length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    height: 50,
                                                    width: 75,
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey,
                                                        borderRadius:
                                                            const BorderRadius.all(
                                                                Radius.circular(
                                                                    5)),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                "${getData.adImage![index].image}"),
                                                            fit: BoxFit.fill)),
                                                  );
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, top: 10),
                                          child: CommonText(
                                            text: StringResources.postDetail,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: ColorResource.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(top: 10),
                                    //   child: Row(
                                    //     children: [
                                    //       CommonElevatedButton(borderRadius: 5,
                                    //         onPressed: () {
                                    //
                                    //         },
                                    //         textSize: 18,
                                    //         buttonColor: ColorResource.green.withOpacity(0.2),
                                    //         textColor: ColorResource.black,
                                    //         width: 150,
                                    //         text: StringResources.Cancel,
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, top: 10),
                                          child: CommonText(
                                            text: StringResources.description,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: ColorResource.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, top: 10),
                                          child: CommonText(
                                            text: "${getData.description}",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ColorResource.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, top: 10),
                                          child: CommonText(
                                            text: StringResources.similarAds,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: ColorResource.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Image.asset(ImageResources.similarAdsImg),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 10),
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  CommonNavigator(
                                      child: const NavigatorAllPage(
                                    index: 3,
                                  )));
                            },
                            icon: const Icon(Icons.arrow_back_ios_new,
                                color: ColorResource.white, size: 15),
                          ),
                        ),
                      ),
                    ],
                  )
                : const Text(""),
            postViewDataViewModel!.status == false
                ? const SizedBox()
                : Center(
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      child: const Center(
                          child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(
                                color: ColorResource.green,
                              ))),
                    ),
                  ),
          ],
        ));
  }
}
