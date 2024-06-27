import 'dart:convert';

class PremiumPlanModel {
    int? status;
    String? message;
    bool? success;
    List<Plan>? plans;

    PremiumPlanModel({
        this.status,
        this.message,
        this.success,
        this.plans,
    });

    factory PremiumPlanModel.fromRawJson(String str) => PremiumPlanModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PremiumPlanModel.fromJson(Map<String, dynamic> json) => PremiumPlanModel(
        status: json["status"],
        message: json["message"],
        success: json["success"],
        plans: json["plans"] == null ? [] : List<Plan>.from(json["plans"]!.map((x) => Plan.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "success": success,
        "plans": plans == null ? [] : List<dynamic>.from(plans!.map((x) => x.toJson())),
    };
}

class Plan {
    int? id;
    String? planName;
    String? planType;
    int? planDays;
    String? amount;
    int? initiateChat;
    DateTime? createdAt;
    int? reportAsset;
    int? reportProfile;
    int? editAssetName;
    int? assetPromote;

    Plan({
        this.id,
        this.planName,
        this.planType,
        this.planDays,
        this.amount,
        this.initiateChat,
        this.createdAt,
        this.reportAsset,
        this.reportProfile,
        this.editAssetName,
        this.assetPromote,
    });

    factory Plan.fromRawJson(String str) => Plan.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["id"],
        planName: json["plan_name"],
        planType: json["plan_type"],
        planDays: json["plan_days"],
        amount: json["amount"],
        initiateChat: json["initiate_chat"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        reportAsset: json["reportAsset"],
        reportProfile: json["reportProfile"],
        editAssetName: json["editAssetName"],
        assetPromote: json["assetPromote"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "plan_name": planName,
        "plan_type": planType,
        "plan_days": planDays,
        "amount": amount,
        "initiate_chat": initiateChat,
        "createdAt": createdAt?.toIso8601String(),
        "reportAsset": reportAsset,
        "reportProfile": reportProfile,
        "editAssetName": editAssetName,
        "assetPromote": assetPromote,
    };
}
