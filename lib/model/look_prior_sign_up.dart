// To parse this JSON data, do
//
//     final lookPriorSignUp = lookPriorSignUpFromJson(jsonString);

import 'dart:convert';

LookPriorSignUp lookPriorSignUpFromJson(String str) =>
    LookPriorSignUp.fromJson(json.decode(str));

String lookPriorSignUpToJson(LookPriorSignUp data) =>
    json.encode(data.toJson());

class LookPriorSignUp {
  LookPriorSignUp({
    this.email,
    this.name,
    this.password,
    this.phoneNumber,
    this.countryCode,
    this.deviceToken,
    this.deviceType,
  });

  String? email;
  String? name;
  String? password;
  String? phoneNumber;
  String? countryCode;
  String? deviceToken;
  String? deviceType;

  factory LookPriorSignUp.fromJson(Map<String, dynamic> json) =>
      LookPriorSignUp(
        email: json["email"],
        name: json["name"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        countryCode: json["countryCode"],
        deviceToken: json["deviceToken"],
        deviceType: json["deviceType"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "password": password,
        "phoneNumber": phoneNumber,
        "countryCode": countryCode,
        "deviceToken": deviceToken,
        "deviceType": deviceType,
      };
}
