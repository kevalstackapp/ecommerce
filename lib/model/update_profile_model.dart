// To parse this JSON data, do
//
//     final updateProfileModel = updateProfileModelFromJson(jsonString);

import 'dart:convert';

UpdateProfileModel updateProfileModelFromJson(String str) => UpdateProfileModel.fromJson(json.decode(str));

String updateProfileModelToJson(UpdateProfileModel data) => json.encode(data.toJson());

class UpdateProfileModel {
  UpdateProfileModel({
    this.firstName,
    this.lastName,
    this.email,
    this.userTypeId,
    this.businessName,
    this.website,
    this.phoneNumber,
    this.publicProfile,
    this.fullAddress,
    this.ispublicemail,
    this.countryCode,
    this.latitude,
    this.longitude,
  });

  String? firstName;
  String? lastName;
  String? email;
  num? userTypeId;
  String? businessName;
  String? website;
  String? phoneNumber;
  bool? publicProfile;
  String? fullAddress;
  bool? ispublicemail;
  String? countryCode;
  double? latitude;
  double? longitude;

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    userTypeId: json["userTypeId"],
    businessName: json["businessName"],
    website: json["website"],
    phoneNumber: json["phoneNumber"],
    publicProfile: json["publicProfile"],
    fullAddress: json["fullAddress"],
    ispublicemail: json["ispublicemail"],
    countryCode: json["countryCode"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "userTypeId": userTypeId,
    "businessName": businessName,
    "website": website,
    "phoneNumber": phoneNumber,
    "publicProfile": publicProfile,
    "fullAddress": fullAddress,
    "ispublicemail": ispublicemail,
    "countryCode": countryCode,
    "latitude": latitude,
    "longitude": longitude,
  };
}
