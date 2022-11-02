import 'dart:convert';
import 'package:ecommerce/common/app/shred_preference.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class RestServices {
  static String baseUrl = "https://lookprstage.com/admin/";

  static String mToken = "";

  static String signApi = "/api/v1/data/signup";
  static String loginApi = "api/v1/data/signin";
  static String googleApi = "/api/v1/data/signin";
  static String forgotApi = "/api/v1/data/forgotpassword?emailId=";
  static String getProfileApi = "/api/v1/data/getprofiledetail";
  static String changePasswordApi = "api/v1/data/changepassword";
  static String logoutApi = "api/v1/data/logout?userId=";
  static String updateProfileApi = "api/v1/data/updateprofile";
  static String profileImage = "${baseUrl}api/v1/data/saveprofileimage";
  static String postAddImageSave = "api/v1/detail/saveadimages?addDetailId=";
  static String postAdDetailApi = "$baseUrl/api/v1/detail/AddOrUpdateAd2";


  static Map<String, String> headers = {'Content-Type': 'application/json'};

  static dynamic postRestMethods(
      {@required String? endpoints,
      @required Map<String, dynamic>? bodyParam}) async {
    try {
      String url = '$baseUrl$endpoints';
      log('Url --> $url');
      Response response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(bodyParam));
      log('Response statusCode --> ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Response body --> ${response.body}');
        return response.body;
      }
    } catch (e) {
      log('catch exception in post $endpoints --> $e');
      return null;
    }
  }

  static dynamic postRestMethodsWithHeaders(
      {@required String? endpoints,
      @required Map<String, dynamic>? bodyParam,
      Map<String, String>? headers}) async {
    try {
      String url = '$baseUrl$endpoints';
      log('Url --> $url');
      Response response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(bodyParam));
      log('Response statusCode --> ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Response body --> ${response.body}');
        return response.body;
      }
    } catch (e) {
      log('catch exception in post $endpoints --> $e');
      return null;
    }
  }

  static dynamic postRestMethodWithParameter(
      {@required String? endPoints}) async {
    try {
      String url = "$baseUrl$endPoints";

      log("url------>$url");

      Response response = await http.post(Uri.parse(url), headers: headers);
      log("status code---->${response.statusCode}");

      if (response.statusCode == 200) {
        log("body---->${response.body}");
        return response.body;
      }
    } on Exception catch (e) {
      log("catch exception for post $endPoints----->$e");
      return null;
    }
  }

  static dynamic getRestMethods(
      {@required String? endpoints, Map<String, String>? headers}) async {
    try {
      String url = '$baseUrl$endpoints';
      log('Url --> $url');
      Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      log('Response statusCode --> ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Response body --> ${response.body}');
        return response.body;
      }
    } catch (e) {
      log('catch exception in post $endpoints --> $e');
      return null;
    }
  }
}
