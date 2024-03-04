// To parse this JSON data, do
//
//     final vegetablesmodel = vegetablesmodelFromJson(jsonString);

import 'dart:convert';

Vegetablesmodel vegetablesmodelFromJson(String str) => Vegetablesmodel.fromJson(json.decode(str));

String vegetablesmodelToJson(Vegetablesmodel data) => json.encode(data.toJson());

class Vegetablesmodel {
    bool? success;
    Data? data;
    String? message;

    Vegetablesmodel({
        this.success,
        this.data,
        this.message,
    });

    factory Vegetablesmodel.fromJson(Map<String, dynamic> json) => Vegetablesmodel(
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
    List<VegetableList>? vegetableList;

    Data({
        this.vegetableList,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        vegetableList: json["vegetable_list"] == null ? [] : List<VegetableList>.from(json["vegetable_list"]!.map((x) => VegetableList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "vegetable_list": vegetableList == null ? [] : List<dynamic>.from(vegetableList!.map((x) => x.toJson())),
    };
}

class VegetableList {
    String? id;
    String? nameEng;
    String? nameTamil;
    int? addedBy;
    DateTime? createdAt;
    DateTime? updatedAt;

    VegetableList({
        this.id,
        this.nameEng,
        this.nameTamil,
        this.addedBy,
        this.createdAt,
        this.updatedAt,
    });

    factory VegetableList.fromJson(Map<String, dynamic> json) => VegetableList(
        id: json["id"],
        nameEng: json["name_eng"],
        nameTamil: json["name_tamil"],
        addedBy: json["added_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_eng": nameEng,
        "name_tamil": nameTamil,
        "added_by": addedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
