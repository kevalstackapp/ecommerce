import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:ecommerce/screen/home_page/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikePage extends StatefulWidget {
  GlobalKey<ScaffoldState> scaffoldKey;

  LikePage(this.scaffoldKey, {super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
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
            text: StringResources.saved,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: ColorResource.white,
          ),
          centerTitle: true,
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: SizedBox(
              height: double.infinity,
              child: Container(
                decoration: const BoxDecoration(
                    color: ColorResource.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: GridView.builder(padding: const EdgeInsets.only(top: 10),
                  itemCount: 4,
                  shrinkWrap: true,
                  //physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Container(
                                  height: 26,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )),
        )
      ]),
    );
  }
}
