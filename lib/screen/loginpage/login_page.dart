import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/text_form_field.dart';
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
  List<String> item = ["India", "Albania", "Belarus", "	Cambodia"];
  String dropdownvalue = 'India';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorResource.green,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: ColorResource.green,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  SizedBox(
                      height: 100,
                      child: Image.asset(
                        ImageResources.loginLogo,
                      )),
                  SizedBox(
                    child: Text(
                      StringResources.loginpageRegister,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              color: ColorResource.white)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 170),
            child: Stack(
              children: [
                Container(
                  height: 500,
                  decoration: const BoxDecoration(
                      color: ColorResource.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: AppTextField(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: ColorResource.green.withOpacity(0.1),
                                child: SvgPicture.asset(
                                  ImageResources.youricon,
                                ),
                              ),
                            ),
                            hintText: StringResources.yourname,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: AppTextField(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: ColorResource.green.withOpacity(0.1),
                                child: SvgPicture.asset(
                                  ImageResources.emailicon,
                                ),
                              ),
                            ),
                            hintText: StringResources.emailaddres,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              CountryPickerDropdown(
                                initialValue: 'AR',
                                itemBuilder: _buildDropdownItem,
                                priorityList:[
                                  CountryPickerUtils.getCountryByIsoCode('GB'),
                                  CountryPickerUtils.getCountryByIsoCode('CN'),
                                ],
                                sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
                                onValuePicked: (Country country) {
                                  print("${country.name}");
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 90,
                                width: 150,
                                child: AppTextField(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      color:
                                          ColorResource.green.withOpacity(0.1),
                                      child: SvgPicture.asset(
                                          ImageResources.phoneicon),
                                    ),
                                  ),
                                  hintText: StringResources.phonenumber,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: AppTextField(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  color: ColorResource.green.withOpacity(0.1),
                                  child: SvgPicture.asset(
                                    ImageResources.passwordicon,
                                  )),
                            ),
                            hintText: StringResources.password,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: AppTextField(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  color: ColorResource.green.withOpacity(0.1),
                                  child: SvgPicture.asset(
                                    ImageResources.confmpasswordicon,
                                  )),
                            ),
                            hintText: StringResources.confirmpassword,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("Register"),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }


  Widget _buildDropdownItem(Country country) => Container(
    child: Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(
          width: 8.0,
        ),
        Text("+${country.phoneCode}(${country.isoCode})"),
      ],
    ),
  );
}
