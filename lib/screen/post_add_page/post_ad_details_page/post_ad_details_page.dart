import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:ecommerce/common/widget/elevated_button.dart';
import 'package:ecommerce/screen/post_add_page/post_ad_details_page/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_fonts/google_fonts.dart';

class PostAdDetailsPage extends StatefulWidget {
  const PostAdDetailsPage({Key? key}) : super(key: key);

  @override
  State<PostAdDetailsPage> createState() => _PostAdDetailsPageState();
}

class _PostAdDetailsPageState extends State<PostAdDetailsPage> {
  List<String> itemList = ['Owner', 'Business'];
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: ColorResource.green,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white),
    );
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CommonText(
                  text: StringResources.adDetails,
                  color: ColorResource.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CommonText(
                  text: StringResources.title,
                  color: ColorResource.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              PostAdDetailModel.titleTextFiled(),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CommonText(
                  text: StringResources.amount,
                  color: ColorResource.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              PostAdDetailModel.amountTextFiled(),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CommonText(
                  text: StringResources.description,
                  color: ColorResource.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              PostAdDetailModel.descriptionTextFiled(),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CommonText(
                  text: StringResources.selectcategory,
                  color: ColorResource.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 47,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: ColorResource.grey),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      alignment: Alignment.center,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 17, color: ColorResource.black)),
                      hint: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: CommonText(
                          text: StringResources.selectcategory,
                          color: ColorResource.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      value: selectedItem,
                      onChanged: (newValue) {
                        setState(() {
                          selectedItem = newValue;
                        });
                      },
                      items: itemList.map((selectedItem) {
                        return DropdownMenuItem(
                          value: selectedItem,
                          child: Text(selectedItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CommonText(
                  text: StringResources.selectSubCategory,
                  color: ColorResource.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 47,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: ColorResource.grey),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      alignment: Alignment.center,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 17, color: ColorResource.black)),
                      hint: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: CommonText(
                          text: StringResources.selectSubCategory,
                          color: ColorResource.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      value: selectedItem,
                      onChanged: (newValue) {
                        setState(() {
                          selectedItem = newValue;
                        });
                      },
                      items: itemList.map((selectedItem) {
                        return DropdownMenuItem(
                          value: selectedItem,
                          child: Text(selectedItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CommonText(
                  text: StringResources.selectSuSubcategory,
                  color: ColorResource.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 47,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: ColorResource.grey),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      alignment: Alignment.center,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 17, color: ColorResource.black)),
                      hint: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: CommonText(
                          text: StringResources.selectSuSubcategory,
                          color: ColorResource.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      value: selectedItem,
                      onChanged: (newValue) {
                        setState(() {
                          selectedItem = newValue;
                        });
                      },
                      items: itemList.map((selectedItem) {
                        return DropdownMenuItem(
                          value: selectedItem,
                          child: Text(selectedItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CommonText(
                  text: StringResources.selectLocation,
                  color: ColorResource.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 47,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      border: Border.all(color: Colors.grey, width: 0.9)),
                  child: ListTile(
                    onTap: () async {
                      await PlacesAutocomplete.show(
                        cursorColor: ColorResource.black,
                        context: context,
                        apiKey: "AIzaSyAscbd7-eNvZYUdyJyPEqNW9kQT7ZuscOA",
                        onError: onError,
                        mode: Mode.fullscreen,
                        // or Mode.fullscreen
                        language: 'fr',
                      );
                    },
                    leading: const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: CommonText(
                        text: StringResources.selectLocation,
                        color: ColorResource.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const CommonElevatedButton(
                buttonColor: ColorResource.green,
                text: StringResources.postAd,
                textColor: ColorResource.white,
              ),
              const SizedBox(
                height: 30,
              ),

            ]),
          ),
        ),
      ]),
    );
  }

  void onError(response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.errorMessage ?? 'Unknown error'),
      ),
    );
  }
}

// Today I have a PostAd page ui and select location on tap to google map search bar.but google map api key not work.
