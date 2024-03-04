

import 'dart:convert';

Userprofile userprofileFromJson(String str) => Userprofile.fromJson(json.decode(str));

String userprofileToJson(Userprofile data) => json.encode(data.toJson());

class Userprofile {
    bool? success;
    Data? data;
    String? message;

    Userprofile({
        this.success,
        this.data,
        this.message,
    });

    factory Userprofile.fromJson(Map<String, dynamic> json) => Userprofile(
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
    ProfileDetails? profileDetails;

    Data({
        this.profileDetails,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        profileDetails: json["profile_details"] == null ? null : ProfileDetails.fromJson(json["profile_details"]),
    );

    Map<String, dynamic> toJson() => {
        "profile_details": profileDetails?.toJson(),
    };
}

class ProfileDetails {
    String? name;
    String? icNumber;
    String? username;
    String? email;

    ProfileDetails({
        this.name,
        this.icNumber,
        this.username,
        this.email,
    });

    factory ProfileDetails.fromJson(Map<String, dynamic> json) => ProfileDetails(
        name: json["name"],
        icNumber: json["ic_number"],
        username: json["username"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "ic_number": icNumber,
        "username": username,
        "email": email,
    };
}
