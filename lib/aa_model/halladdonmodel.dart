// To parse this JSON data, do
//
//     final halladdonlistmodel = halladdonlistmodelFromJson(jsonString);

import 'dart:convert';

Halladdonlistmodel halladdonlistmodelFromJson(String str) => Halladdonlistmodel.fromJson(json.decode(str));

String halladdonlistmodelToJson(Halladdonlistmodel data) => json.encode(data.toJson());

class Halladdonlistmodel {
    bool? success;
    Data? data;
    String? message;

    Halladdonlistmodel({
        this.success,
        this.data,
        this.message,
    });

    factory Halladdonlistmodel.fromJson(Map<String, dynamic> json) => Halladdonlistmodel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "message": message,
    };
}

class Data {
    List<HallAddonList>? hallAddonList;

    Data({
        this.hallAddonList,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        hallAddonList: json["hall_addon_list"] == null ? [] : List<HallAddonList>.from(json["hall_addon_list"]!.map((x) => HallAddonList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "hall_addon_list": hallAddonList == null ? [] : List<dynamic>.from(hallAddonList!.map((x) => x.toJson())),
    };
}

class HallAddonList {
    String? id;
    String? name;
    String? description;
    String? amount;
    String? commision;
    dynamic companyId;
    String? image;
    DateTime? created;
    DateTime? modified;
    List<HallAddonServiceList>? hallAddonServiceList;

    HallAddonList({
        this.id,
        this.name,
        this.description,
        this.amount,
        this.commision,
        this.companyId,
        this.image,
        this.created,
        this.modified,
        this.hallAddonServiceList,
    });

    factory HallAddonList.fromJson(Map<String, dynamic> json) => HallAddonList(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        amount: json["amount"],
        commision: json["commision"],
        companyId: json["company_id"],
        image: json["image"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        modified: json["modified"] == null ? null : DateTime.parse(json["modified"]),
        hallAddonServiceList: json["hall_addon_service_list"] == null ? [] : List<HallAddonServiceList>.from(json["hall_addon_service_list"]!.map((x) => HallAddonServiceList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "amount": amount,
        "commision": commision,
        "company_id": companyId,
        "image": image,
        "created": created?.toIso8601String(),
        "modified": modified?.toIso8601String(),
        "hall_addon_service_list": hallAddonServiceList == null ? [] : List<dynamic>.from(hallAddonServiceList!.map((x) => x.toJson())),
    };
}

class HallAddonServiceList {
    String? id;
    int? addonId;
    int? serviceId;
    int? amount;
    String? serviceName;
    String? serviceDescription;

    HallAddonServiceList({
        this.id,
        this.addonId,
        this.serviceId,
        this.amount,
        this.serviceName,
        this.serviceDescription,
    });

    factory HallAddonServiceList.fromJson(Map<String, dynamic> json) => HallAddonServiceList(
        id: json["id"],
        addonId: json["addon_id"],
        serviceId: json["service_id"],
        amount: json["amount"],
        serviceName: json["service_name"],
        serviceDescription: json["service_description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "addon_id": addonId,
        "service_id": serviceId,
        "amount": amount,
        "service_name": serviceName,
        "service_description": serviceDescription,
    };
}
