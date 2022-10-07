import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:ecommerce/common/widget/search_text_field.dart';
import 'package:ecommerce/screen/home_page/widget.dart';
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
      drawer: draweropen(),
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 47,
                  child: SvgPicture.asset(
                    ImageResources.notificationimg,
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
                SizedBox(
                  height: 47,
                  //padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SvgPicture.asset(
                    ImageResources.layoutlogo,
                  ),
                ),
                Container(
                  height: 47,
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: SvgPicture.asset(
                    ImageResources.locationlogo,
                  ),
                )
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
                                color: const Color(0xff2ECC71).withOpacity(0.1),
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
                    height: 190,
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
                              // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                              //   SvgPicture.asset(
                              //     ImageResources.location,
                              //     height: 11,
                              //   )
                              // ],
                              // ),
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
                                        borderRadius: BorderRadius.circular(6)),
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
                        text: StringResources.topads,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(
                    child: GridView.builder(itemCount: 4,shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
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
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
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
                              const SizedBox(
                                height: 10,
                              ),
                              Row( mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 27,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: ColorResource.green,
                                        borderRadius: BorderRadius.circular(6)),
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
                  )
                ],
              )),
        ),
      ]),
    );
  }
}
