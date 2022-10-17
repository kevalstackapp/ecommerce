import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class RestServices {
  static String baseUrl = "https://lookprstage.com/admin/";

  static String mToken = "";

  static String signApi = "/api/v1/data/signup";
  static String loginApi = "/api/v1/data/signin";
  static String googleApi = "/api/v1/data/signin";

  static Map<String, String> headers = {'Content-Type': 'application/json'};

  static dynamic postRestMethods(
      {@required String? endpoints,
      @required Map<String, dynamic>? bodyParam}) async {
    try {
      String url = '$baseUrl$endpoints';
      print('Url --> $url');
      Response response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(bodyParam));
      print('Response statusCode --> ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Response body --> ${response.body}');
        return response.body;
      }
    } catch (e) {
      print('catch exception in post $endpoints --> $e');
      return null;
    }
  }
}
