import 'dart:io';
import 'dart:typed_data';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/common_navigator.dart';
import 'package:ecommerce/common/widget/common_text.dart';
import 'package:ecommerce/common/widget/elevated_button.dart';
import 'package:ecommerce/model/get_profile_model.dart';
import 'package:ecommerce/screen/navigator_all_page/navigator_all_page.dart';
import 'package:ecommerce/screen/user_profile_page/user_edit_page/user_edit_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserEditPage extends StatefulWidget {
  GetProfileModel? getProfileModel;

  UserEditPage(this.getProfileModel);

  @override
  State<UserEditPage> createState() => UserEditPageState();
}

class UserEditPageState extends State<UserEditPage> {
  List<String> itemList = ['Owner', 'Business'];
  String? selectedItem = "Owner";
  Country selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('91');
  UserEditViewModel? userEditViewModel;
  bool isSwitchOn = true;
  bool isSwitchOnEmail = false;
  String imgPath = "";
  Uint8List? bytesImgPath;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool status = false;

  @override
  void initState() {
    super.initState();
    selectedDialogCountry = CountryPickerUtils.getCountryByPhoneCode(
        widget.getProfileModel!.countryCode.toString());

    firstNameController.text = widget.getProfileModel!.userName.toString();
    lastNameController.text = widget.getProfileModel!.lastName.toString();
    addressController.text = widget.getProfileModel!.fullAddress.toString();
    websiteController.text = widget.getProfileModel!.website.toString();
    phoneController.text = widget.getProfileModel!.phoneNumber.toString();
    emailController.text = widget.getProfileModel!.email.toString();
    isSwitchOn = widget.getProfileModel!.publicProfile!;
    isSwitchOnEmail = widget.getProfileModel!.ispublicemail!;
  }

  @override
  Widget build(BuildContext context) {
    userEditViewModel ?? (userEditViewModel = UserEditViewModel(this));

    return Scaffold(
      backgroundColor: ColorResource.green,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70), // here the desired height
        child: AppBar(
          backgroundColor: ColorResource.green,
          elevation: 0,
          title: const CommonText(
            text: StringResources.profile,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: ColorResource.white,
          ),
          centerTitle: true,
        ),
      ),
      body: Stack(
        children: [
          ListView(children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: ColorResource.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Column(children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: CommonText(
                            text: StringResources.firstName,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: ColorResource.grey,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 65),
                          child: CommonText(
                            text: StringResources.lastName,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: ColorResource.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: firstNameController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: ColorResource.green),
                                    borderRadius: BorderRadius.circular(8)),
                                contentPadding:
                                    const EdgeInsets.only(top: 5, left: 15),
                                hintStyle: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: ColorResource.black)),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 0.1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: lastNameController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: ColorResource.green),
                                    borderRadius: BorderRadius.circular(10)),
                                contentPadding:
                                    const EdgeInsets.only(top: 5, left: 15),
                                hintStyle: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: ColorResource.black)),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 0.1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 47,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: ColorResource.grey),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  alignment: Alignment.center,
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 17,
                                          color: ColorResource.black)),
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
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: const [
                          CommonText(
                            text: StringResources.address,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: ColorResource.grey,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: addressController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: ColorResource.green),
                                    borderRadius: BorderRadius.circular(8)),
                                contentPadding:
                                    const EdgeInsets.only(top: 5, left: 15),
                                hintStyle: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: ColorResource.black)),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 0.1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: const [
                          CommonText(
                            text: StringResources.email,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: ColorResource.grey,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              keyboardType: TextInputType.emailAddress,
                              initialValue: widget.getProfileModel!.email,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: ColorResource.green),
                                    borderRadius: BorderRadius.circular(8)),
                                contentPadding:
                                    const EdgeInsets.only(top: 5, left: 15),
                                hintStyle: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: ColorResource.black)),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 0.1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: const [
                          CommonText(
                            text: StringResources.websiteTitle,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: ColorResource.grey,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: websiteController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: ColorResource.green),
                                    borderRadius: BorderRadius.circular(8)),
                                contentPadding:
                                    const EdgeInsets.only(top: 5, left: 15),
                                hintStyle: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: ColorResource.black)),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 0.1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                userEditViewModel!
                                    .openCountryPickerDialog(context);
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: ColorResource.grey)),
                                child: ListTile(
                                  title: userEditViewModel!.buildDialogItem(
                                    selectedDialogCountry,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: phoneController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: ColorResource.green),
                                      borderRadius: BorderRadius.circular(8)),
                                  contentPadding:
                                      const EdgeInsets.only(top: 5, left: 15),
                                  hintStyle: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: ColorResource.black)),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 0.1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ListTile(
                        leading: const CommonText(
                          text: StringResources.publicProfile,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: ColorResource.black,
                        ),
                        trailing: Switch(
                          activeColor: ColorResource.green,
                          value: isSwitchOn,
                          onChanged: (value) {
                            setState(() {
                              isSwitchOn = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ListTile(
                        leading: const CommonText(
                          text: StringResources.publicEmail,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: ColorResource.black,
                        ),
                        trailing: Switch(
                          activeColor: ColorResource.green,
                          value: isSwitchOnEmail,
                          onChanged: (value) {
                            setState(() {
                              isSwitchOnEmail = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          CommonElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CommonNavigator(
                                      child: const NavigatorAllPage(
                                    index: 3,
                                  )));
                            },
                            textSize: 18,
                            buttonColor: ColorResource.lowYellow,
                            textColor: ColorResource.grey,
                            width: 100,
                            text: StringResources.Cancel,
                          ),
                          CommonElevatedButton(
                            onPressed: () async {
                              await userEditViewModel!.updateProfileMethod(
                                  context,
                                  firstNameController,
                                  lastNameController,
                                  addressController,
                                  emailController,
                                  websiteController,
                                  selectedDialogCountry,
                                  phoneController,
                                  isSwitchOn,
                                  isSwitchOnEmail,
                                  selectedItem!,
                                  status = true);
                            },
                            textSize: 18,
                            buttonColor: ColorResource.green,
                            textColor: ColorResource.grey,
                            width: 100,
                            text: StringResources.save,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ]),
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: ColorResource.white,
                            ),
                            color: ColorResource.grey,
                            image: widget.getProfileModel!.imagePath == null
                                ? DecorationImage(
                                    image: FileImage(File(imgPath)))
                                : DecorationImage(
                                    image: NetworkImage(
                                        "${widget.getProfileModel!.imagePath}"),
                                    fit: BoxFit.fill)),
                      ),
                    ),
                    Positioned(
                      top: 65,
                      left: 197,
                      child: InkWell(
                        onTap: () {
                          userEditViewModel!
                              .showModelButtomsSheetPhoto(context);
                        },
                        child: SizedBox(
                          height: 36,
                          width: 36,
                          child: Image.asset(ImageResources.groupEdit),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
          status == false
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
                            child: CircularProgressIndicator())),
                  ),
                ),
        ],
      ),
    );
  }
}
