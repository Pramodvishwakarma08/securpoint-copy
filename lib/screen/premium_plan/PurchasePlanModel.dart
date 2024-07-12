import 'dart:convert';

class PurchasePlanModel {
    String? url;

    PurchasePlanModel({
        this.url,
    });

    factory PurchasePlanModel.fromRawJson(String str) => PurchasePlanModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PurchasePlanModel.fromJson(Map<String, dynamic> json) => PurchasePlanModel(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}
