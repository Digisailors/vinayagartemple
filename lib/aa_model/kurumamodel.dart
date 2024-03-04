// To parse this JSON data, do
//
//     final kurumalist = kurumalistFromJson(jsonString);

import 'dart:convert';

Kurumalist kurumalistFromJson(String str) => Kurumalist.fromJson(json.decode(str));

String kurumalistToJson(Kurumalist data) => json.encode(data.toJson());

class Kurumalist {
    bool? success;
    Data? data;
    String? message;

    Kurumalist({
        this.success,
        this.data,
        this.message,
    });

    factory Kurumalist.fromJson(Map<String, dynamic> json) => Kurumalist(
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
    List<KurumaTypeList>? kurumaTypeList;

    Data({
        this.kurumaTypeList,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        kurumaTypeList: json["kuruma_type_list"] == null ? [] : List<KurumaTypeList>.from(json["kuruma_type_list"]!.map((x) => KurumaTypeList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "kuruma_type_list": kurumaTypeList == null ? [] : List<dynamic>.from(kurumaTypeList!.map((x) => x.toJson())),
    };
}

class KurumaTypeList {
    String? id;
    String? nameEng;
    String? nameTamil;
    int? count;

    KurumaTypeList({
        this.id,
        this.nameEng,
        this.nameTamil,
        this.count,
    });

    factory KurumaTypeList.fromJson(Map<String, dynamic> json) => KurumaTypeList(
        id: json["id"],
        nameEng: json["name_eng"],
        nameTamil: json["name_tamil"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_eng": nameEng,
        "name_tamil": nameTamil,
        "count": count,
    };
}
