import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:ecommerce/common/widget/elevated_button.dart';
import 'package:ecommerce/screen/post_add_page/storage_page/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({Key? key}) : super(key: key);

  @override
  State<StoragePage> createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  List selected = List.generate(StoragePageModel.storageImage.length, (index) => false,);

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
                    text: StringResources.increaseStorage,
                    color: ColorResource.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
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
            child: SingleChildScrollView(
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                elevation: 3,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ListTile(
                        leading: CommonText(
                          text: StringResources.sellFaster,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ColorResource.black,
                        ),
                      ),
                      const Divider(),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: CommonText(
                          text: StringResources.currentStorage,
                          color: ColorResource.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: CommonText(
                          text: StringResources.currentStorageText,
                          color: ColorResource.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        child: GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          itemCount: StoragePageModel.storageImage.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1.6, crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selected = List.filled(5, false);
                                  selected[index] = true;
                                });
                              },
                              child: Stack(children: [
                                Container(
                                  height: 85,
                                  width: 151,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(StoragePageModel
                                              .storageImage[index]))),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  StoragePageModel
                                                      .storageBanner[index],
                                                ),
                                                scale: 1)),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 12),
                                          child: CommonText(
                                            text: StoragePageModel
                                                .storageBannerPrize[index],
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: ColorResource.white,
                                          ),
                                        ),
                                      ),
                                      CommonText(
                                        text: StoragePageModel
                                            .storageStoragePlan[index],
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: ColorResource.white,
                                      ),
                                    ],
                                  ),
                                ),
                                selected[index]
                                    ? Positioned(
                                        right: 13,
                                        top: -2.7,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 20,
                                          width: 20,
                                          decoration: const BoxDecoration(
                                              color: ColorResource.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(8),
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10))),
                                          child: SizedBox(
                                            height: 15,
                                            width: 15,
                                            child: SvgPicture.asset(
                                              ImageResources.chekicon,
                                              color: ColorResource.green,
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox()
                              ]),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ]),
              ),
            ),
          ),
        ),
        Container(
          height: 10,
          color: ColorResource.white,
        ),
        Container(
          color: ColorResource.white,
          child: CommonElevatedButton(
            onPressed: () {
              setState(() {});
            },
            buttonColor: ColorResource.green,
            textSize: 16,
            text: StringResources.pay,
          ),
        ),
        Container(
          height: 10,
          color: ColorResource.white,
        )
      ]),
    );
  }
}
