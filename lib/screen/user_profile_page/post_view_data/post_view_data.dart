import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/app_video_player.dart';
import 'package:ecommerce/common/widget/common_navigator.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:ecommerce/model/get_post_ad_data_model.dart' as model;
import 'package:ecommerce/screen/navigator_all_page/navigator_all_page.dart';
import 'package:ecommerce/screen/post_add_page/post_add_page.dart';
import 'package:ecommerce/screen/user_profile_page/post_view_data/post_view_data_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PostViewData extends StatefulWidget {
  model.FilteredAddList? showData;

  PostViewData(this.showData, {super.key});

  @override
  State<PostViewData> createState() => PostViewDataState();
}

class PostViewDataState extends State<PostViewData> {
  PostViewDataViewModel? postViewDataViewModel;


  int clickImage = 0;
  PageController pageController = PageController();

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
                              Stack(
                                children: [
                                  Container(
                                    height: 200,
                                    width: double.infinity,
                                    color: ColorResource.green,
                                    child: PageView.builder(
                                      onPageChanged: (value) {
                                        clickImage = value;
                                      },
                                      controller: pageController,
                                      itemCount: postViewDataViewModel!
                                          .allVideoAndImage.length,
                                      itemBuilder: (context, index) {
                                        return SizedBox(
                                            height: 250,
                                            width: double.infinity,
                                            child: postViewDataViewModel!
                                                    .allVideoAndImage[index]
                                                    .containsKey('video')
                                                ? Container(
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                postViewDataViewModel!
                                                                            .allVideoAndImage[
                                                                        index]
                                                                    ["video"]),
                                                            fit: BoxFit.fill)),
                                                    child: IconButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              CommonNavigator(
                                                                  child:
                                                                      AppVideoPlayer("${postViewDataViewModel!.broadCastModel!.adVideo![index].video}")));
                                                        },
                                                        icon: const Icon(size: 30,
                                                          Icons.play_circle,
                                                          color: ColorResource
                                                              .white,
                                                        )),
                                                  )
                                                : Image.network(
                                                    postViewDataViewModel!
                                                            .allVideoAndImage[
                                                        index]["image"],
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.fill,
                                                  ));
                                      },
                                    ),
                                  ),
                                  Align(
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
                                              child: PopupMenuButton(
                                                shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    15),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    15),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    15))),
                                                position:
                                                    PopupMenuPosition.under,
                                                offset: const Offset(-3, 8),
                                                child: const Icon(
                                                    Icons.more_horiz,
                                                    color: ColorResource.white,
                                                    size: 20),
                                                onSelected: (value) {
                                                  if (value == 1) {
                                                    Navigator.pushReplacement(context, CommonNavigator(child:  const PostAddPage()));

                                                  } else if (value == 2) {
                                                    postViewDataViewModel!
                                                        .deleteByAdminMethod();
                                                  }
                                                },
                                                itemBuilder: (BuildContext bc) {
                                                  return const [
                                                    PopupMenuItem(
                                                      value: 1,
                                                      child: Text(
                                                          StringResources.edit),
                                                    ),
                                                    PopupMenuItem(
                                                      value: 2,
                                                      child: Text(
                                                          StringResources
                                                              .delete),
                                                    ),
                                                  ];
                                                },
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    heightFactor: 27,
                                    child: SmoothPageIndicator(
                                        controller: pageController,
                                        count: postViewDataViewModel!
                                            .allVideoAndImage.length,
                                        effect: const WormEffect(
                                            activeDotColor: ColorResource.white,
                                            radius: 30,
                                            dotWidth: 12,
                                            dotHeight: 12),
                                        onDotClicked: (index) {}),
                                  )
                                ],
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
                                                    postViewDataViewModel!
                                                        .allVideoAndImage
                                                        .length,
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      var clickImage = index;
                                                      pageController.jumpToPage(
                                                          clickImage);
                                                    },
                                                    child: Container(
                                                      height: 50,
                                                      width: 75,
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey,
                                                          borderRadius:
                                                              const BorderRadius.all(
                                                                  Radius.circular(
                                                                      5)),
                                                          image: postViewDataViewModel!
                                                                  .allVideoAndImage[
                                                                      index]
                                                                  .containsKey(
                                                                      'image')
                                                              ? DecorationImage(
                                                                  image: NetworkImage(
                                                                      "${postViewDataViewModel!.allVideoAndImage[index]["image"]}"),
                                                                  fit: BoxFit
                                                                      .fill)
                                                              : DecorationImage(
                                                                  image:
                                                                      NetworkImage("${postViewDataViewModel!.allVideoAndImage[index]["video"]}"),
                                                                  fit: BoxFit.fill)),
                                                    ),
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

                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      itemCount: 3,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15, top: 10),
                                          child: Card(
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  5)),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              "${getData.similarAddList![index].adImageThumb}"),
                                                          fit: BoxFit.fill)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 10),
                                                            child: CommonText(
                                                              text:
                                                                  "${getData.similarAddList![index].title}",
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  ColorResource
                                                                      .black,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 10),
                                                            child: CommonText(
                                                              text:
                                                                  "\$${getData.similarAddList![index].amount}",
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  ColorResource
                                                                      .green,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          right: 10,
                                                        ),
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
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    //Image.asset(ImageResources.similarAdsImg),
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


