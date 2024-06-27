import 'dart:convert';

import '../../model/CategoriesListModel.dart';
import '../../model/assets_model.dart';

class HomePageModel {
    int? status;
    String? message;
    bool? success;
    List<Category>? categories;
    List<Asset>? assets;

    HomePageModel({
        this.status,
        this.message,
        this.success,
        this.categories,
        this.assets,
    });

    factory HomePageModel.fromRawJson(String str) => HomePageModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
        status: json["status"],
        message: json["message"],
        success: json["success"],
        categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
        assets: json["assets"] == null ? [] : List<Asset>.from(json["assets"]!.map((x) => Asset.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "success": success,
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "assets": assets == null ? [] : List<dynamic>.from(assets!.map((x) => x.toJson())),
    };
}



