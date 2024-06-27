import 'dart:convert';

import '../../model/assets_model.dart';

class AllAssetsModel {
    int? status;
    String? message;
    bool? success;
    List<Asset> ?assets;
    int? count;

    AllAssetsModel({
        this.status,
        this.message,
        this.success,
        this.assets,
        this.count,
    });

    factory AllAssetsModel.fromRawJson(String str) => AllAssetsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AllAssetsModel.fromJson(Map<String, dynamic> json) => AllAssetsModel(
        status: json["status"],
        message: json["message"],
        success: json["success"],
        assets: json["assets"] == null ? [] : List<Asset>.from(json["assets"]!.map((x) => Asset.fromJson(x))),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "success": success,
        "assets": assets == null ? [] : List<dynamic>.from(assets!.map((x) => x.toJson())),
        "count": count,
    };
}


