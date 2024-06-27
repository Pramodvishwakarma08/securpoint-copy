import 'dart:convert';

import '../../model/assets_model.dart';

class MyAssetsModel {
  int? status;
  String? message;
  bool? success;
  List<Asset>? assets;
  int? total;

  MyAssetsModel({
    this.status,
    this.message,
    this.success,
    this.assets,
    this.total,
  });

  factory MyAssetsModel.fromRawJson(String str) => MyAssetsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyAssetsModel.fromJson(Map<String, dynamic> json) => MyAssetsModel(
    status: json["status"],
    message: json["message"],
    success: json["success"],
    assets: json["assets"] == null ? [] : List<Asset>.from(json["assets"]!.map((x) => Asset.fromJson(x))),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "success": success,
    "assets": assets == null ? [] : List<dynamic>.from(assets!.map((x) => x.toJson())),
    "total": total,
  };
}
