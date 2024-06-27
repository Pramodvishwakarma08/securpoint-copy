import 'dart:convert';

import '../../model/assets_model.dart';

class SavedAssetsModel {
    int? status;
    String? message;
    bool? success;
    List<Asset>? assets;

    SavedAssetsModel({
        this.status,
        this.message,
        this.success,
        this.assets,
    });

    factory SavedAssetsModel.fromRawJson(String str) => SavedAssetsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SavedAssetsModel.fromJson(Map<String, dynamic> json) => SavedAssetsModel(
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


