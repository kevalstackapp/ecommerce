import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:ecommerce/common/app/shred_preference.dart';
import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/common/widget/app_button.dart';
import 'package:ecommerce/common/widget/elevated_button.dart';
import 'package:ecommerce/rest_api/rest_services.dart';
import 'package:ecommerce/screen/register_page/widget.dart';
import 'package:ecommerce/service/auth_service.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('91');
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confiPassword = TextEditingController();
  String a = "1";
  bool status = false;
  AuthService authService = AuthService();

  RegisterPageViewModel? registerPageViewModel;

  @override
  void initState() {
    super.initState();
    FirebaseMessaging firebaseMessaging =
        FirebaseMessaging.instance; // Change here
    firebaseMessaging.getToken().then((token) {
      log("token is $token");
      RestServices.mToken = token!;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorResource.green,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    registerPageViewModel ??
        (registerPageViewModel = RegisterPageViewModel(this));
    return WillPopScope(
      onWillPop: () {
        return registerPageViewModel!.backButton(context);
      },
      child: Scaffold(
          backgroundColor: ColorResource.green,
          body: Column(children: [
            Container(
              color: ColorResource.green,
              child: Column(children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: SizedBox(
                      height: 70,
                      width: 87,
                      child: Image.asset(
                        ImageResources.looklogo,
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
              ]),
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
                  child: Stack(children: [
                    Form(
                      key: formGlobalKey,
                      child: ListView(
                        children: [
                          nameTextFiled(userName),
                          sizeMaring(),
                          emailTextFiled(email),
                          sizeMaring(),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 25,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      openCountryPickerDialog();
                                    },
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: ColorResource.grey)),
                                      child: ListTile(
                                        title: _buildDialogItem(
                                            _selectedDialogCountry),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: phonenumaberTextfFlied(phoneNumber),
                                ),
                              ],
                            ),
                          ),
                          sizeMaring(),
                          passwordTextfFlied(password),
                          sizeMaring(),
                          confmPasswordTextfFlied(confiPassword),
                          sizeMaring(),
                          CommonElevatedButton(
                            onPressed: () async {
                              submit();

                              log("dfgdgfgfdgfkggkd++=====");
                            },
                            buttonColor: ColorResource.green,
                            text: StringResources.resisterbutton,
                            textColor: ColorResource.white,
                          ),
                          sizeMaring(),
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: divderrow()),
                          sizeMaring(),
                          AppButton(onTap: () async {
                           await authService.facebookLogin();
                         // log("login${abc!.message}");
                          },
                            buttonColor: ColorResource.blue,
                            buttonIcon: ImageResources.fackbookicon,
                            text: StringResources.Facebookname,
                          ),
                          sizeMaring(),
                          AppButton(
                            onTap: () async {
                              final result = await authService.googleSign();

                              await registerPageViewModel!.googleSignMethod(
                                  context,
                                  result!.id,
                                  result.email,
                                  result.displayName,
                                  status = true);
                            },
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
                    ),
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
                  ])),
            ),
          ])),
    );
  }

  Widget _buildDialogItem(Country country) => Padding(
        padding: const EdgeInsets.only(bottom: 13),
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            Flexible(
                child: Text(
              "(${country.name})+${country.phoneCode}",
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              )),
            )),
          ],
        ),
      );

  void openCountryPickerDialog() => showDialog(
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

  submit() async {
    final isValid = formGlobalKey.currentState?.validate();
    if (isValid!) {
      if (isValid == true) {
        await registerPageViewModel?.signUpMethod(
            context,
            userName,
            email,
            phoneNumber,
            password,
            confiPassword,
            _selectedDialogCountry,
            RestServices.mToken,
            a,
            status = true);
      } else {
        const Text("");
      }
    }
    formGlobalKey.currentState?.save();
  }
}
