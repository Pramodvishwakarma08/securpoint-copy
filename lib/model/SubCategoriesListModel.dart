import 'dart:convert';

import '../screen/home_page/HomePageModel.dart';
import 'CategoriesListModel.dart';

class SubCategoriesListModel {
    int? status;
    String? message;
    bool? success;
    List<SubCategory>? subCategories;

    SubCategoriesListModel({
        this.status,
        this.message,
        this.success,
        this.subCategories,
    });

    factory SubCategoriesListModel.fromRawJson(String str) => SubCategoriesListModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SubCategoriesListModel.fromJson(Map<String, dynamic> json) => SubCategoriesListModel(
        status: json["status"],
        message: json["message"],
        success: json["success"],
        subCategories: json["sub_categories"] == null ? [] : List<SubCategory>.from(json["sub_categories"]!.map((x) => SubCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "success": success,
        "sub_categories": subCategories == null ? [] : List<dynamic>.from(subCategories!.map((x) => x.toJson())),
    };
}

class SubCategory {
    int? id;
    String? subCategory;
    int? categoryId;
    Category? category;

    SubCategory({
        this.id,
        this.subCategory,
        this.categoryId,
        this.category,
    });

    factory SubCategory.fromRawJson(String str) => SubCategory.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        subCategory: json["subCategory"],
        categoryId: json["categoryId"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "subCategory": subCategory,
        "categoryId": categoryId,
        "category": category?.toJson(),
    };
}

