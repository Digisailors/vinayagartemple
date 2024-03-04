// To parse this JSON data, do
//
//     final ricecategaerymodel = ricecategaerymodelFromJson(jsonString);

import 'dart:convert';

Ricecategaerymodel ricecategaerymodelFromJson(String str) => Ricecategaerymodel.fromJson(json.decode(str));

String ricecategaerymodelToJson(Ricecategaerymodel data) => json.encode(data.toJson());

class Ricecategaerymodel {
    bool? success;
    Data? data;
    String? message;

    Ricecategaerymodel({
        this.success,
        this.data,
        this.message,
    });

    factory Ricecategaerymodel.fromJson(Map<String, dynamic> json) => Ricecategaerymodel(
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
    List<RiceCategoryList>? riceCategoryList;

    Data({
        this.riceCategoryList,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        riceCategoryList: json["rice_category_list"] == null ? [] : List<RiceCategoryList>.from(json["rice_category_list"]!.map((x) => RiceCategoryList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "rice_category_list": riceCategoryList == null ? [] : List<dynamic>.from(riceCategoryList!.map((x) => x.toJson())),
    };
}

class RiceCategoryList {
    String? id;
    String? nameEng;
    String? nameTamil;
    int? status;

    RiceCategoryList({
        this.id,
        this.nameEng,
        this.nameTamil,
        this.status,
    });

    factory RiceCategoryList.fromJson(Map<String, dynamic> json) => RiceCategoryList(
        id: json["id"],
        nameEng: json["name_eng"],
        nameTamil: json["name_tamil"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_eng": nameEng,
        "name_tamil": nameTamil,
        "status": status,
    };
}
