// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.success = false,
    this.message,
    this.userId,
    this.isEditable = false,
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  bool success;
  String? message;
  num? userId;
  bool isEditable;
  String? accessToken;
  String? tokenType;
  num? expiresIn;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["Success"],
    message: json["Message"],
    userId: json["UserId"],
    isEditable: json["IsEditable"],
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
  );

  Map<String, dynamic> toJson() => {
    "Success": success,
    "Message": message,
    "UserId": userId,
    "IsEditable": isEditable,
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
  };
}
