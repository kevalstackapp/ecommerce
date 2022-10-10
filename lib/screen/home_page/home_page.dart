import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_navigator.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:ecommerce/common/widget/search_text_field.dart';
import 'package:ecommerce/screen/home_page/widget.dart';
import 'package:ecommerce/screen/location_page/location_page.dart';
import 'package:ecommerce/screen/notifications_page/notifications_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      showMyDialog(context);
    });
  }

  var _bottomNavIndex = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorResource.green,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
        key: scaffoldKey,
        drawerEnableOpenDragGesture: true,
        drawer: draweropen(context),
        backgroundColor: ColorResource.green,
        body: Column(children: [
          const SizedBox(
            height: 40,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      scaffoldKey.currentState!.openDrawer();
                      setState(() {});
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 47,
                        child: SvgPicture.asset(
                          ImageResources.drawerimg,
                        )),
                  ),
                  SizedBox(
                      height: 47,
                      child: Image.asset(
                        ImageResources.looklogo,
                      )),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          CommonNavigator(child: const NotificationsPage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 47,
                      child: SvgPicture.asset(
                        ImageResources.notificationimg,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SearchTextField(
                      icon: ImageResources.search,
                      hintText: StringResources.searchhere,
                      fontSize: 14,
                    ),
                  ),
                  PopupMenuButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    position: PopupMenuPosition.under,
                    offset: const Offset(-3, 8),
                    child: SizedBox(
                      height: 47,
                      //padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SvgPicture.asset(
                        ImageResources.layoutlogo,
                      ),
                    ),
                    onSelected: (value) {},
                    itemBuilder: (BuildContext bc) {
                      return const [
                        PopupMenuItem(
                          value: '/hello',
                          child: Text(StringResources.all),
                        ),
                        PopupMenuItem(
                          value: '/about',
                          child: Text(StringResources.top),
                        ),
                        PopupMenuItem(
                          value: '/contact',
                          child: Text(StringResources.regular),
                        )
                      ];
                    },
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          CommonNavigator(child: const LocationPage()));
                    },
                    child: Container(
                      height: 47,
                      padding: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: SvgPicture.asset(
                        ImageResources.locationlogo,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
                decoration: const BoxDecoration(
                    color: ColorResource.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: ListView(
                  children: [
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: CommonText(
                          text: StringResources.category,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      height: 102,
                      child: ListView.builder(
                        itemCount: name.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                height: 71,
                                width: 74,
                                margin: const EdgeInsets.only(
                                    top: 7, left: 9, bottom: 8, right: 12),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xff2ECC71).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    img[index],
                                  ),
                                ),
                              ),
                              CommonText(
                                text: name[index],
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: CommonText(
                              text: StringResources.topads,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            )),
                        const Padding(
                            padding: EdgeInsets.only(left: 200),
                            child: CommonText(
                              text: StringResources.seeall,
                              fontSize: 14,
                              color: ColorResource.green,
                              fontWeight: FontWeight.w500,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: SvgPicture.asset(
                            ImageResources.backarow,
                            color: ColorResource.green,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 193,
                      child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  height: 90,
                                  width: 140,
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      image: DecorationImage(
                                          image: AssetImage(adsimg[index]),
                                          fit: BoxFit.fill),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: SvgPicture.asset(
                                    ImageResources.likeicon,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonText(
                                        text: modelname[index],
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    CommonText(
                                        text: prizename[index],
                                        fontWeight: FontWeight.w500,
                                        color: ColorResource.green,
                                        fontSize: 10),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(
                                      ImageResources.location,
                                      height: 11,
                                    ),
                                    CommonText(
                                      text: locationname1[index],
                                      fontSize: 10,
                                      color: ColorResource.grey,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 27,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: ColorResource.green,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Container(
                                          alignment: Alignment.center,
                                          width: 76,
                                          child: SvgPicture.asset(
                                            ImageResources.share,
                                            height: 40,
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    SvgPicture.asset(
                                      ImageResources.trophyicon,
                                      height: 27,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: CommonText(
                          text: StringResources.nearyou,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      child: GridView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.9, crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  height: 90,
                                  width: 140,
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      image: DecorationImage(
                                          image: AssetImage(gridimg[index]),
                                          fit: BoxFit.fill),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: SvgPicture.asset(
                                    ImageResources.likeicon,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CommonText(
                                          text: gridname[index],
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      CommonText(
                                          text: prizename[index],
                                          fontWeight: FontWeight.w500,
                                          color: ColorResource.green,
                                          fontSize: 10),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        ImageResources.location,
                                        height: 11,
                                      ),
                                      CommonText(
                                        text: locationname1[index],
                                        fontSize: 10,
                                        color: ColorResource.grey,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 26,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: ColorResource.green,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Container(
                                            alignment: Alignment.center,
                                            width: 76,
                                            child: SvgPicture.asset(
                                              ImageResources.share,
                                              height: 40,
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: ColorResource.green,
          child: const Icon(
            size: 40,
            Icons.add,
            color: ColorResource.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          //notchSmoothness: NotchSmoothness.verySmoothEdge,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          itemCount: 4,
          tabBuilder: (index, isActive) {
            return Container(
              height: 27,
              width: 27,
              margin:
                  const EdgeInsets.only(top: 7, left: 9, bottom: 8, right: 12),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  color: isActive ? ColorResource.green : ColorResource.grey,
                  iconimg[index],
                ),
              ),
            );
          },
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return navigator[index];
                },
              ));
            });
          },
        ));
  }
}
