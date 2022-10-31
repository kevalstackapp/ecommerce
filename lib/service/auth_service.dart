import 'package:ecommerce/common/app/shred_preference.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<GoogleSignInAccount?> googleSign() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      var result = await googleSignIn.signIn();
      log("reslut Google -->$result");
      return result;
    } catch (e) {
      log("GoogleSign-->$e");
      return null;
    }
  }

  Future<LoginResult?> facebookLogin() async {
    try {
      final value =
          //     await FacebookAuth.login(permissions: ['public_profile', 'email']);
          await FacebookAuth.instance.login();
      log("helloo-->dd");
      log("values-->${value.status}");
      log("LoginStatus-->${LoginStatus.success}");
      if (value.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        log('facebook_login_data:-$userData');
        return value;
      }
    } catch (error) {
      log("error-->$error");
      return null;
    }
    return null;
  }
}
