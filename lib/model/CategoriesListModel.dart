import 'dart:convert';

class CategoriesListModel {
    int? status;
    String? message;
    bool? success;
    List<Category>? categories;

    CategoriesListModel({
        this.status,
        this.message,
        this.success,
        this.categories,
    });

    factory CategoriesListModel.fromRawJson(String str) => CategoriesListModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CategoriesListModel.fromJson(Map<String, dynamic> json) => CategoriesListModel(
        status: json["status"],
        message: json["message"],
        success: json["success"],
        categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "success": success,
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    };
}

class Category {
    int? id;
    String? categoryName;
    String? categoryImage;
    int? count;

    Category({
        this.id,
        this.categoryName,
        this.categoryImage,
        this.count,
    });

    factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryName: json["categoryName"],
        categoryImage: json["categoryImage"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName,
        "categoryImage": categoryImage,
        "count": count,
    };
}

class AddAssetsStatusModel {
    List<StatusObj>? status;
    String? message;
    bool? success;

    AddAssetsStatusModel({
        this.status,
        this.message,
        this.success,
    });

    factory AddAssetsStatusModel.fromRawJson(String str) => AddAssetsStatusModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddAssetsStatusModel.fromJson(Map<String, dynamic> json) => AddAssetsStatusModel(
        status: json["status"] == null ? [] : List<StatusObj>.from(json["status"]!.map((x) => StatusObj.fromJson(x))),
        message: json["message"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? [] : List<dynamic>.from(status!.map((x) => x.toJson())),
        "message": message,
        "success": success,
    };
}

class StatusObj {
    int? id;
    String? name;

    StatusObj({
        this.id,
        this.name,
    });

    factory StatusObj.fromRawJson(String str) => StatusObj.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory StatusObj.fromJson(Map<String, dynamic> json) => StatusObj(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
