import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/elevated_button.dart';
import 'package:ecommerce/common/widget/text_form_field.dart';
import 'package:ecommerce/screen/loginpage/login_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('91');

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
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        Center(
          child: SizedBox(
              height: 80,
              child: Image.asset(
                ImageResources.loginLogo,
              )),
        ),
        Text(
          StringResources.loginpageRegister,
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: ColorResource.white)),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: Container(
              decoration: const BoxDecoration(
                  color: ColorResource.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    AppTextField(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          height: 10,
                          ImageResources.youricon,
                        ),
                      ),
                      hintText: StringResources.yourname,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AppTextField(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          height: 10,
                          ImageResources.emailicon,
                        ),
                      ),
                      hintText: StringResources.emailaddres,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: ColorResource.grey)),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: ListTile(
                                  onTap: _openCountryPickerDialog,
                                  title:
                                      _buildDialogItem(_selectedDialogCountry),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 45,
                              child: AppTextField(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: SvgPicture.asset(
                                      ImageResources.phoneicon),
                                ),
                                hintText: StringResources.phonenumber,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AppTextField(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                            color: ColorResource.green.withOpacity(0.1),
                            child: SvgPicture.asset(
                              ImageResources.passwordicon,
                            )),
                      ),
                      hintText: StringResources.password,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AppTextField(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(
                          height: 10,
                          ImageResources.confmpasswordicon,
                        ),
                      ),
                      hintText: StringResources.confirmpassword,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CommonElevatedButton(
                      onPressed: () {
                        return initState();
                      },
                      buttonColor: ColorResource.green,
                      text: StringResources.resisterbutton,
                      textColor: ColorResource.white,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 145,
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                          Text(StringResources.Or),
                          SizedBox(
                            width: 139,
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppButton(
                      buttonColor: ColorResource.fackbookcolor,
                      buttonIcon: ImageResources.fackbookicon,
                    )
                  ],
                ),
              )),
        ),
      ]),
    );
  }

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          Flexible(
              child: Text(
            "(${country.name})+${country.phoneCode}",
            overflow: TextOverflow.ellipsis,
          )),
        ],
      );

  void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
          child: CountryPickerDialog(
            titlePadding: const EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: const InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: const Text('Select your phone code'),
            onValuePicked: (Country country) =>
                setState(() => _selectedDialogCountry = country),
            itemBuilder: _buildDialogItem,
            priorityList: [
              CountryPickerUtils.getCountryByIsoCode('TR'),
              CountryPickerUtils.getCountryByIsoCode('US'),
            ],
          ),
        ),
      );
}
