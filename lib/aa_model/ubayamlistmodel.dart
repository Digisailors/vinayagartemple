// To parse this JSON data, do
//
//     final ubayamlistdetailmodel = ubayamlistdetailmodelFromJson(jsonString);

import 'dart:convert';

Ubayamlistdetailmodel ubayamlistdetailmodelFromJson(String str) => Ubayamlistdetailmodel.fromJson(json.decode(str));

String ubayamlistdetailmodelToJson(Ubayamlistdetailmodel data) => json.encode(data.toJson());

class Ubayamlistdetailmodel {
    bool? success;
    Data? data;
    String? message;

    Ubayamlistdetailmodel({
        this.success,
        this.data,
        this.message,
    });

    factory Ubayamlistdetailmodel.fromJson(Map<String, dynamic> json) => Ubayamlistdetailmodel(
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
    List<UbayamSettingList>? ubayamSettingList;

    Data({
        this.ubayamSettingList,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        ubayamSettingList: json["ubayam_setting_list"] == null ? [] : List<UbayamSettingList>.from(json["ubayam_setting_list"]!.map((x) => UbayamSettingList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ubayam_setting_list": ubayamSettingList == null ? [] : List<dynamic>.from(ubayamSettingList!.map((x) => x.toJson())),
    };
}

class UbayamSettingList {
    String? id;
    String? name;
    String? description;
    String? amount;
    String? image;
    int? eventType;
    DateTime? created;
    DateTime? modified;

    UbayamSettingList({
        this.id,
        this.name,
        this.description,
        this.amount,
        this.image,
        this.eventType,
        this.created,
        this.modified,
    });

    factory UbayamSettingList.fromJson(Map<String, dynamic> json) => UbayamSettingList(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        amount: json["amount"],
        image: json["image"],
        eventType: json["event_type"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        modified: json["modified"] == null ? null : DateTime.parse(json["modified"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "amount": amount,
        "image": image,
        "event_type": eventType,
        "created": created?.toIso8601String(),
        "modified": modified?.toIso8601String(),
    };
}
