import 'dart:convert';

import '../../../model/assets_model.dart';

class GetUserByIdModel {
    int? status;
    String? message;
    bool? success;
    User? user;

    GetUserByIdModel({
        this.status,
        this.message,
        this.success,
        this.user,
    });

    factory GetUserByIdModel.fromRawJson(String str) => GetUserByIdModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetUserByIdModel.fromJson(Map<String, dynamic> json) => GetUserByIdModel(
        status: json["status"],
        message: json["message"],
        success: json["success"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "success": success,
        "user": user?.toJson(),
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
    List<Asset>? asset;

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
        this.asset,
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
        asset: json["Asset"] == null ? [] : List<Asset>.from(json["Asset"]!.map((x) => Asset.fromJson(x))),
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
        "Asset": asset == null ? [] : List<dynamic>.from(asset!.map((x) => x.toJson())),
    };
}


