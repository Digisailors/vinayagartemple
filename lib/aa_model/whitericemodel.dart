// To parse this JSON data, do
//
//     final whiteRicemodel = whiteRicemodelFromJson(jsonString);

import 'dart:convert';

WhiteRicemodel whiteRicemodelFromJson(String str) => WhiteRicemodel.fromJson(json.decode(str));

String whiteRicemodelToJson(WhiteRicemodel data) => json.encode(data.toJson());

class WhiteRicemodel {
    bool? success;
    Data? data;
    String? message;

    WhiteRicemodel({
        this.success,
        this.data,
        this.message,
    });

    factory WhiteRicemodel.fromJson(Map<String, dynamic> json) => WhiteRicemodel(
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
    List<RiceTypeList>? riceTypeList;

    Data({
        this.riceTypeList,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        riceTypeList: json["rice_type_list"] == null ? [] : List<RiceTypeList>.from(json["rice_type_list"]!.map((x) => RiceTypeList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "rice_type_list": riceTypeList == null ? [] : List<dynamic>.from(riceTypeList!.map((x) => x.toJson())),
    };
}

class RiceTypeList {
    String? id;
    String? name;
    int? status;

    RiceTypeList({
        this.id,
        this.name,
        this.status,
    });

    factory RiceTypeList.fromJson(Map<String, dynamic> json) => RiceTypeList(
        id: json["id"],
        name: json["name"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
    };
}
