// To parse this JSON data, do
//
//     final getPostAdDataModel = getPostAdDataModelFromJson(jsonString);

import 'dart:convert';

GetPostAdDataModel getPostAdDataModelFromJson(String str) => GetPostAdDataModel.fromJson(json.decode(str));

String getPostAdDataModelToJson(GetPostAdDataModel data) => json.encode(data.toJson());

class GetPostAdDataModel {
  GetPostAdDataModel({
    this.success,
    this.message,
    this.pageNo,
    this.isNextPage,
    this.pageSize,
    this.totalRecords,
    this.filteredAddList,
  });

  bool? success;
  String? message;
  num? pageNo;
  bool? isNextPage;
  num? pageSize;
  num? totalRecords;
  List<FilteredAddList>? filteredAddList;

  factory GetPostAdDataModel.fromJson(Map<String, dynamic> json) => GetPostAdDataModel(
    success: json["Success"],
    message: json["Message"],
    pageNo: json["pageNo"],
    isNextPage: json["IsNextPage"],
    pageSize: json["pageSize"],
    totalRecords: json["TotalRecords"],
    filteredAddList: List<FilteredAddList>.from(json["FilteredAddList"].map((x) => FilteredAddList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Success": success,
    "Message": message,
    "pageNo": pageNo,
    "IsNextPage": isNextPage,
    "pageSize": pageSize,
    "TotalRecords": totalRecords,
    "FilteredAddList": List<dynamic>.from(filteredAddList!.map((x) => x.toJson())),
  };
}

class FilteredAddList {
  FilteredAddList({
    this.broadCastId,
    this.userId,
    this.adDetailId,
    this.title,
    this.fullAddress,
    this.state,
    this.city,
    this.stateName,
    this.cityName,
    this.amount,
    this.amountStr,
    this.adImage,
    this.adImageThumb,
    this.adVideo,
    this.adVideoThumb,
    this.isLiked,
    this.isFavAd,
    this.noOfViews,
    this.description,
    this.isOwner,
    this.isTopAdd,
    this.isMyAd,
    this.orderByDistance,
    this.randomSort,
    this.isDeleted,
    this.isReviewed,
    this.isApproved,
    this.latitude,
    this.longitude,
    this.totalExposureDays,
    this.perDayExposurePrice,
    this.isFeatureAd,
    this.hasOnlyVideo,
    this.categoryId,
    this.subCategoryId,
    this.categoryName,
    this.subCategoryName,
  });

  num? broadCastId;
  num? userId;
  num? adDetailId;
  String? title;
  FullAddress? fullAddress;
  State? state;
  City? city;
  dynamic stateName;
  dynamic cityName;
  double? amount;
  String? amountStr;
  String? adImage;
  String? adImageThumb;
  String? adVideo;
  String? adVideoThumb;
  bool? isLiked;
  bool? isFavAd;
  num? noOfViews;
  String? description;
  bool? isOwner;
  bool? isTopAdd;
  bool? isMyAd;
  dynamic orderByDistance;
  num? randomSort;
  bool? isDeleted;
  bool? isReviewed;
  bool? isApproved;
  double? latitude;
  double? longitude;
  dynamic totalExposureDays;
  dynamic perDayExposurePrice;
  bool? isFeatureAd;
  bool? hasOnlyVideo;
  num? categoryId;
  num? subCategoryId;
  CategoryName? categoryName;
  SubCategoryName? subCategoryName;

  factory FilteredAddList.fromJson(Map<String, dynamic> json) => FilteredAddList(
    broadCastId: json["BroadCastId"] == null ? null : json["BroadCastId"],
    userId: json["UserId"],
    adDetailId: json["AdDetailId"],
    title: json["Title"] == null ? null : json["Title"],
    fullAddress: json["FullAddress"] == null ? null : fullAddressValues.map![json["FullAddress"]],
    state: json["State"] == null ? null : stateValues.map![json["State"]],
    city: json["City"] == null ? null : cityValues.map![json["City"]],
    stateName: json["StateName"],
    cityName: json["CityName"],
    amount: json["Amount"].toDouble(),
    amountStr: json["AmountStr"],
    adImage: json["AdImage"],
    adImageThumb: json["AdImageThumb"],
    adVideo: json["AdVideo"],
    adVideoThumb: json["AdVideoThumb"],
    isLiked: json["IsLiked"],
    isFavAd: json["IsFavAd"],
    noOfViews: json["NoOfViews"],
    description: json["Description"] == null ? null : json["Description"],
    isOwner: json["IsOwner"],
    isTopAdd: json["IsTopAdd"],
    isMyAd: json["IsMyAd"],
    orderByDistance: json["OrderByDistance"],
    randomSort: json["RandomSort"],
    isDeleted: json["IsDeleted"],
    isReviewed: json["IsReviewed"],
    isApproved: json["IsApproved"],
    latitude: json["Latitude"] == null ? null : json["Latitude"].toDouble(),
    longitude: json["Longitude"] == null ? null : json["Longitude"].toDouble(),
    totalExposureDays: json["TotalExposureDays"],
    perDayExposurePrice: json["PerDayExposurePrice"],
    isFeatureAd: json["IsFeatureAd"],
    hasOnlyVideo: json["HasOnlyVideo"],
    categoryId: json["CategoryId"],
    subCategoryId: json["SubCategoryId"],
    categoryName: json["CategoryName"] == null ? null : categoryNameValues.map![json["CategoryName"]],
    subCategoryName: json["SubCategoryName"] == null ? null : subCategoryNameValues.map![json["SubCategoryName"]],
  );

  Map<String, dynamic> toJson() => {
    "BroadCastId": broadCastId == null ? null : broadCastId,
    "UserId": userId,
    "AdDetailId": adDetailId,
    "Title": title == null ? null : title,
    "FullAddress": fullAddress == null ? null : fullAddressValues.reverse![fullAddress],
    "State": state == null ? null : stateValues.reverse![state],
    "City": city == null ? null : cityValues.reverse![city],
    "StateName": stateName,
    "CityName": cityName,
    "Amount": amount,
    "AmountStr": amountStr,
    "AdImage": adImage,
    "AdImageThumb": adImageThumb,
    "AdVideo": adVideo,
    "AdVideoThumb": adVideoThumb,
    "IsLiked": isLiked,
    "IsFavAd": isFavAd,
    "NoOfViews": noOfViews,
    "Description": description == null ? null : description,
    "IsOwner": isOwner,
    "IsTopAdd": isTopAdd,
    "IsMyAd": isMyAd,
    "OrderByDistance": orderByDistance,
    "RandomSort": randomSort,
    "IsDeleted": isDeleted,
    "IsReviewed": isReviewed,
    "IsApproved": isApproved,
    "Latitude": latitude == null ? null : latitude,
    "Longitude": longitude == null ? null : longitude,
    "TotalExposureDays": totalExposureDays,
    "PerDayExposurePrice": perDayExposurePrice,
    "IsFeatureAd": isFeatureAd,
    "HasOnlyVideo": hasOnlyVideo,
    "CategoryId": categoryId,
    "SubCategoryId": subCategoryId,
    "CategoryName": categoryName == null ? null : categoryNameValues.reverse![categoryName],
    "SubCategoryName": subCategoryName == null ? null : subCategoryNameValues.reverse![subCategoryName],
  };
}

enum CategoryName { COMMUNITY }

final categoryNameValues = EnumValues({
  "Community": CategoryName.COMMUNITY
});

enum City { EMPTY, TAMWORTH }

final cityValues = EnumValues({
  "": City.EMPTY,
  "Tamworth": City.TAMWORTH
});

enum FullAddress { SURAT_GUJARAT_INDIA, THE_1_MUSEUM_STREET_PIPITEA_WELLINGTON_6160_NEW_ZEALAND }

final fullAddressValues = EnumValues({
  "Surat, Gujarat, India": FullAddress.SURAT_GUJARAT_INDIA,
  "1 Museum Street, Pipitea, Wellington 6160, New Zealand": FullAddress.THE_1_MUSEUM_STREET_PIPITEA_WELLINGTON_6160_NEW_ZEALAND
});

enum State { EMPTY, NEW_HAMPSHIRE }

final stateValues = EnumValues({
  "": State.EMPTY,
  "New Hampshire": State.NEW_HAMPSHIRE
});

enum SubCategoryName { ACTIVITIES }

final subCategoryNameValues = EnumValues({
  "Activities": SubCategoryName.ACTIVITIES
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
