// To parse this JSON data, do
//
//     final hallslotdateselectionmodel = hallslotdateselectionmodelFromJson(jsonString);

import 'dart:convert';

Hallslotdateselectionmodel hallslotdateselectionmodelFromJson(String str) => Hallslotdateselectionmodel.fromJson(json.decode(str));

String hallslotdateselectionmodelToJson(Hallslotdateselectionmodel data) => json.encode(data.toJson());

class Hallslotdateselectionmodel {
    bool? success;
    Data? data;
    String? message;

    Hallslotdateselectionmodel({
        this.success,
        this.data,
        this.message,
    });

    factory Hallslotdateselectionmodel.fromJson(Map<String, dynamic> json) => Hallslotdateselectionmodel(
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
    List<HallbookingSlotList>? hallbookingSlotList;

    Data({
        this.hallbookingSlotList,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        hallbookingSlotList: json["hallbooking_slot_list"] == null ? [] : List<HallbookingSlotList>.from(json["hallbooking_slot_list"]!.map((x) => HallbookingSlotList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "hallbooking_slot_list": hallbookingSlotList == null ? [] : List<dynamic>.from(hallbookingSlotList!.map((x) => x.toJson())),
    };
}

class HallbookingSlotList {
    int? slotId;
    String? slotStartTime;
    String? slotEndTime;
    String? slotSeason;

    HallbookingSlotList({
        this.slotId,
        this.slotStartTime,
        this.slotEndTime,
        this.slotSeason,
    });

    factory HallbookingSlotList.fromJson(Map<String, dynamic> json) => HallbookingSlotList(
        slotId: json["slot_id"],
        slotStartTime: json["slot_start_time"],
        slotEndTime: json["slot_end_time"],
        slotSeason: json["slot_season"],
    );

    Map<String, dynamic> toJson() => {
        "slot_id": slotId,
        "slot_start_time": slotStartTime,
        "slot_end_time": slotEndTime,
        "slot_season": slotSeason,
    };
}
