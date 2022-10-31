import 'package:ecommerce/common/app/shred_preference.dart';
import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessagePage extends StatefulWidget {
  GlobalKey<ScaffoldState> scaffoldKey;

  MessagePage(this.scaffoldKey, {super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  ShredPreference shredPreference = ShredPreference();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorResource.green,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: ColorResource.green,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), // here the desired height
        child: AppBar(
          backgroundColor: ColorResource.green,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              widget.scaffoldKey.currentState!.openDrawer();
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
            text: StringResources.message,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: ColorResource.white,
          ),
          centerTitle: true,
        ),
      ),
      body: DefaultTabController(
          length: 2, // length of tabs
          initialIndex: 0,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
              decoration: const BoxDecoration(
                  color: ColorResource.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: const TabBar(
                labelColor: ColorResource.green,
                unselectedLabelColor: ColorResource.black,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                indicatorColor: Colors.green,
                tabs: [
                  Tab(
                    text: StringResources.buying,
                  ),
                  Tab(
                    text: StringResources.selling,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5))),
                  child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          color: ColorResource.white,
                          child: ListView(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              ListTile(
                                leading: Stack(
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                        color: ColorResource.grey,
                                        shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  ImageResources.carimag),fit: BoxFit.fill)
                                      ),
                                    ),
                                    Positioned(
                                      top: 28,
                                      left: 20,
                                      child: Container(
                                        height: 18,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: ColorResource.grey,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              width: 0.8,
                                              color: ColorResource.white,
                                            ),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    ImageResources.blueImg),fit: BoxFit.fill)),
                                      ),
                                    ),
                                  ],
                                ),
                                title: const CommonText(
                                  text: StringResources.mithealJohn,
                                  color: ColorResource.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                                subtitle: const CommonText(
                                  text: StringResources.mithealJohnTitle,
                                  color: ColorResource.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: ColorResource.white,
                          child: ListView(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              ListTile(
                                leading: Stack(
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                          color: ColorResource.grey,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  ImageResources.comimg),fit: BoxFit.fill)
                                      ),
                                    ),
                                    Positioned(
                                      top: 28,
                                      left: 20,
                                      child: Container(
                                        height: 18,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: ColorResource.grey,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              width: 0.8,
                                              color: ColorResource.white,
                                            ),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    ImageResources.greenImg),fit: BoxFit.fill)),
                                      ),
                                    ),
                                  ],
                                ),
                                title: const CommonText(
                                  text: StringResources.mithealJohn,
                                  color: ColorResource.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                                subtitle: const CommonText(
                                  text: StringResources.mithealJohnTitle,
                                  color: ColorResource.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                        ),
                      ])),
            )
          ])),
    );
  }
}
