import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:ecommerce/screen/post_add_page/post_ad_details_page/widget.dart';
import 'package:flutter/material.dart';

class PostAdDetailsPage extends StatefulWidget {
  const PostAdDetailsPage({Key? key}) : super(key: key);

  @override
  State<PostAdDetailsPage> createState() => _PostAdDetailsPageState();
}

class _PostAdDetailsPageState extends State<PostAdDetailsPage> {
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
                    text: StringResources.PostyourAd,
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
            child: ListView(children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CommonText(
                  text: StringResources.adDetails,
                  color: ColorResource.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CommonText(
                  text: StringResources.title,
                  color: ColorResource.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10,),
              PostAdDetailModel.titleTextFiled(),
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CommonText(
                  text: StringResources.amount,
                  color: ColorResource.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10,),
              PostAdDetailModel.amountTextFiled(),
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CommonText(
                  text: StringResources.description,
                  color: ColorResource.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10,),
              PostAdDetailModel.descriptionTextFiled()
            ]),
          ),
        ),
      ]),
    );
  }
}
