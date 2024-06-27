import 'dart:convert';

class LoginWithEmailModel {
    int? status;
    bool? success;
    String? message;
    String? token;
    User? user;

    LoginWithEmailModel({
        this.status,
        this.success,
        this.message,
        this.token,
        this.user,
    });

    factory LoginWithEmailModel.fromRawJson(String str) => LoginWithEmailModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LoginWithEmailModel.fromJson(Map<String, dynamic> json) => LoginWithEmailModel(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "token": token,
        "user": user?.toJson(),
    };
}

class User {
    int? id;
    String? email;
    String? password;
    String? fullName;
    dynamic phoneNo;
    dynamic otp;
    dynamic fcmToken;
    String? avatarUrl;
    String? notes;
    dynamic token;
    bool? isVerified;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? nameStatus;
    dynamic lastSeen;
    dynamic otpExpiration;

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
    };
}
