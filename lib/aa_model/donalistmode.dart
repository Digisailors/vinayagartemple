// To parse this JSON data, do
//
//     final donationlistmodel = donationlistmodelFromJson(jsonString);

import 'dart:convert';

Donationlistmodel donationlistmodelFromJson(String str) => Donationlistmodel.fromJson(json.decode(str));

String donationlistmodelToJson(Donationlistmodel data) => json.encode(data.toJson());

class Donationlistmodel {
    bool? success;
    Data? data;
    String? message;

    Donationlistmodel({
        this.success,
        this.data,
        this.message,
    });

    factory Donationlistmodel.fromJson(Map<String, dynamic> json) => Donationlistmodel(
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
    List<DonationSettingList>? donationSettingList;

    Data({
        this.donationSettingList,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        donationSettingList: json["donation_setting_list"] == null ? [] : List<DonationSettingList>.from(json["donation_setting_list"]!.map((x) => DonationSettingList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "donation_setting_list": donationSettingList == null ? [] : List<dynamic>.from(donationSettingList!.map((x) => x.toJson())),
    };
}

class DonationSettingList {
    String? id;
    String? name;
    String? description;
    String? amount;
    String? image;
    DateTime? created;
    DateTime? modified;

    DonationSettingList({
        this.id,
        this.name,
        this.description,
        this.amount,
        this.image,
        this.created,
        this.modified,
    });

    factory DonationSettingList.fromJson(Map<String, dynamic> json) => DonationSettingList(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        amount: json["amount"],
        image: json["image"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        modified: json["modified"] == null ? null : DateTime.parse(json["modified"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "amount": amount,
        "image": image,
        "created": created?.toIso8601String(),
        "modified": modified?.toIso8601String(),
    };
}
