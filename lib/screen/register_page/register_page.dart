import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/app_button.dart';
import 'package:ecommerce/common/widget/elevated_button.dart';
import 'package:ecommerce/screen/login_page/login_page.dart';
import 'package:ecommerce/screen/register_page/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('91');
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorResource.green,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return
      Scaffold(
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
        sizeMaring(),
        Expanded(
          child: Container(
              decoration: const BoxDecoration(
                  color: ColorResource.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Form(
                key: formGlobalKey,
                child: ListView(
                  children: [
                    nameTextFiled(),
                    sizeMaring(),
                    emailTextFiled(),
                    sizeMaring(),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                            //  alignment: Alignment.center,
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
                            flex: 2,
                            child: SizedBox(
                              child: phonenumaberTextfFlied(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizeMaring(),
                    passwordTextfFlied(),
                    sizeMaring(),
                    confmPasswordTextfFlied(),
                    sizeMaring(),
                    CommonElevatedButton(
                      onPressed: () {
                        submit();
                        setState(() {});
                      },
                      buttonColor: ColorResource.green,
                      text: StringResources.resisterbutton,
                      textColor: ColorResource.white,
                    ),
                    sizeMaring(),
                    Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: divderrow()),
                    sizeMaring(),
                    AppButton(
                      buttonColor: ColorResource.blue,
                      buttonIcon: ImageResources.fackbookicon,
                      text: StringResources.Facebookname,
                    ),
                    sizeMaring(),
                    AppButton(
                      buttonColor: ColorResource.black,
                      buttonIcon: ImageResources.appleicon,
                      text: StringResources.applename,
                    ),
                    sizeMaring(),
                    privacyText(context,
                        """  By Clicking on “Register with Facebook” or “Register” you Agree
        To the Lookprior Terms of Service and Privacy Policy"""),
                    sizeMaring(),
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
            overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  )),
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

  void submit() {
    final isValid = formGlobalKey.currentState?.validate();
    if (!isValid!) {
    isValid == null ? Navigator.push(context, MaterialPageRoute(builder: (context) {
      return   const LoginPage();
      },)): const Text("");
    }
    formGlobalKey.currentState?.save();
  }
}
