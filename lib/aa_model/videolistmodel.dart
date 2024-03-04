// To parse this JSON data, do
//
//     final videolistmodel = videolistmodelFromJson(jsonString);

import 'dart:convert';

Videolistmodel videolistmodelFromJson(String str) => Videolistmodel.fromJson(json.decode(str));

String videolistmodelToJson(Videolistmodel data) => json.encode(data.toJson());

class Videolistmodel {
    bool? success;
    Data? data;
    String? message;

    Videolistmodel({
        this.success,
        this.data,
        this.message,
    });

    factory Videolistmodel.fromJson(Map<String, dynamic> json) => Videolistmodel(
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
    List<YoutubeList>? youtubeList;

    Data({
        this.youtubeList,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        youtubeList: json["youtube_list"] == null ? [] : List<YoutubeList>.from(json["youtube_list"]!.map((x) => YoutubeList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "youtube_list": youtubeList == null ? [] : List<dynamic>.from(youtubeList!.map((x) => x.toJson())),
    };
}

class YoutubeList {
    int? id;
    String? title;
    String? description;
    String? url;
    DateTime? created;
    DateTime? modified;

    YoutubeList({
        this.id,
        this.title,
        this.description,
        this.url,
        this.created,
        this.modified,
    });

    factory YoutubeList.fromJson(Map<String, dynamic> json) => YoutubeList(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        modified: json["modified"] == null ? null : DateTime.parse(json["modified"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "url": url,
        "created": created?.toIso8601String(),
        "modified": modified?.toIso8601String(),
    };
}
