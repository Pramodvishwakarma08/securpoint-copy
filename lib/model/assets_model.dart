import 'dart:convert';

class HomePageModel {
  int? status;
  String? message;
  bool? success;
  List<Asset>? assets;

  HomePageModel({
    this.status,
    this.message,
    this.success,
    this.assets,
  });

  factory HomePageModel.fromRawJson(String str) => HomePageModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
    status: json["status"],
    message: json["message"],
    success: json["success"],
    assets: json["assets"] == null ? [] : List<Asset>.from(json["assets"]!.map((x) => Asset.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "success": success,
    "assets": assets == null ? [] : List<dynamic>.from(assets!.map((x) => x.toJson())),
  };
}
class Asset {
  int? id;
  int? userId;
  String? assetName;
  String? assetDetails;
  String? assetIdentifier;
  int? categoryId;
  int? subCategoryId;
  int? lock;
  int? promote;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? expireAt;
  String? longitude;
  String? latitude;
  String? uic;
  List<AssetImage>? assetImages;
  User? user;
  bool? alreadySaved;

  Asset({
    this.id,
    this.userId,
    this.assetName,
    this.assetDetails,
    this.assetIdentifier,
    this.categoryId,
    this.subCategoryId,
    this.lock,
    this.promote,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.expireAt,
    this.longitude,
    this.latitude,
    this.uic,
    this.assetImages,
    this.user,
    this.alreadySaved,
  });

  factory Asset.fromRawJson(String str) => Asset.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
    id: json["id"],
    userId: json["userId"],
    assetName: json["AssetName"],
    assetDetails: json["AssetDetails"],
    assetIdentifier: json["AssetIdentifier"],
    categoryId: json["categoryId"],
    subCategoryId: json["subCategoryId"],
    lock: json["lock"],
    promote: json["promote"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    expireAt: json["expireAt"] == null ? null : DateTime.parse(json["expireAt"]),
    longitude: json["longitude"],
    latitude: json["latitude"],
    uic: json["UIC"],
    assetImages: json["AssetImages"] == null ? [] : List<AssetImage>.from(json["AssetImages"]!.map((x) => AssetImage.fromJson(x))),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    alreadySaved: json["alreadySaved"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "AssetName": assetName,
    "AssetDetails": assetDetails,
    "AssetIdentifier": assetIdentifier,
    "categoryId": categoryId,
    "subCategoryId": subCategoryId,
    "lock": lock,
    "promote": promote,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "expireAt": "${expireAt!.year.toString().padLeft(4, '0')}-${expireAt!.month.toString().padLeft(2, '0')}-${expireAt!.day.toString().padLeft(2, '0')}",
    "longitude": longitude,
    "latitude": latitude,
    "UIC": uic,
    "AssetImages": assetImages == null ? [] : List<dynamic>.from(assetImages!.map((x) => x.toJson())),
    "user": user?.toJson(),
    "alreadySaved": alreadySaved,
  };
}

class AssetImage {
  int? id;
  int? assetId;
  String? imageUrl;

  AssetImage({
    this.id,
    this.assetId,
    this.imageUrl,
  });

  factory AssetImage.fromRawJson(String str) => AssetImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AssetImage.fromJson(Map<String, dynamic> json) => AssetImage(
    id: json["id"],
    assetId: json["assetId"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "assetId": assetId,
    "image_url": imageUrl,
  };
}



class User {
  int? id;
  String? email;
  String? password;
  dynamic fullName;
  dynamic phoneNo;
  String? otp;
  dynamic fcmToken;
  String? avatarUrl;
  dynamic notes;
  dynamic token;
  bool? isVerified;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? nameStatus;
  dynamic lastSeen;
  dynamic otpExpiration;
  int? promotedAssetCount;

  User({
    this.id,
    this.email,
    this.password,
    this.fullName,
    this.phoneNo,
    this.otp,
    this.fcmToken,
    this.avatarUrl,
    this.notes,
    this.token,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.nameStatus,
    this.lastSeen,
    this.otpExpiration,
    this.promotedAssetCount,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    password: json["password"],
    fullName: json["full_name"],
    phoneNo: json["phone_no"],
    otp: json["otp"],
    fcmToken: json["fcm_token"],
    avatarUrl: json["avatar_url"],
    notes: json["notes"],
    token: json["token"],
    isVerified: json["isVerified"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    nameStatus: json["nameStatus"],
    lastSeen: json["lastSeen"],
    otpExpiration: json["otpExpiration"],
    promotedAssetCount: json["promotedAssetCount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
    "full_name": fullName,
    "phone_no": phoneNo,
    "otp": otp,
    "fcm_token": fcmToken,
    "avatar_url": avatarUrl,
    "notes": notes,
    "token": token,
    "isVerified": isVerified,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "nameStatus": nameStatus,
    "lastSeen": lastSeen,
    "otpExpiration": otpExpiration,
    "promotedAssetCount": promotedAssetCount,
  };
}
