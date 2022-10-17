import 'dart:async';
import 'package:ecommerce/common/app/shred_preference.dart';
import 'package:ecommerce/common/constant/color_res.dart';
import 'package:ecommerce/common/constant/image_res.dart';
import 'package:ecommerce/common/constant/string_res.dart';
import 'package:ecommerce/screen/home_page/home_page.dart';
import 'package:ecommerce/screen/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScrren extends StatefulWidget {
  const SplashScrren({Key? key}) : super(key: key);

  @override
  State<SplashScrren> createState() => _SplashScrrenState();
}

class _SplashScrrenState extends State<SplashScrren> {
  bool login = false;

  @override
  void initState() {
    super.initState();
    getString();
    nextScreen();
  }

  Future<void> getString() async {
    login =
        await ShredPreference().getPrefBoolValue(ShredPreference().isLogin) ??
            false;
    log("login-->${login}");
  }

  void nextScreen() {
    Timer(const Duration(seconds: 3), () {
      if (login) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorResource.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 220),
        child: Center(
          child: Column(
            children: [
              //Image.asset(ImageResources.splashscrrenLogo),
              SizedBox(
                  height: 103,
                  width: 150,
                  child: Image.asset(ImageResources.splashscrrenLogo)),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                child: Text(
                  StringResources.splashScreenTitle,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
