// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    bool? success;
    Data? data;
    String? message;

    UserModel({
        this.success,
        this.data,
        this.message,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
    UserDetails? userDetails;

    Data({
        this.userDetails,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userDetails: json["user_details"] == null ? null : UserDetails.fromJson(json["user_details"]),
    );

    Map<String, dynamic> toJson() => {
        "user_details": userDetails?.toJson(),
    };
}

class UserDetails {
    String? username;
    int? role;
    String? email;
    dynamic icNumber;
    int? loginId;
    String? loginName;
    String? siteTitle;
    String? address1;
    String? address2;
    String? city;
    String? postcode;
    String? telephone;
    String? mobile;
    String? gstno;
    String? website;
    int? profileId;
    String? logoImg;

    UserDetails({
        this.username,
        this.role,
        this.email,
        this.icNumber,
        this.loginId,
        this.loginName,
        this.siteTitle,
        this.address1,
        this.address2,
        this.city,
        this.postcode,
        this.telephone,
        this.mobile,
        this.gstno,
        this.website,
        this.profileId,
        this.logoImg,
    });

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        username: json["username"],
        role: json["role"],
        email: json["email"],
        icNumber: json["ic_number"],
        loginId: json["login_id"],
        loginName: json["login_name"],
        siteTitle: json["site_title"],
        address1: json["address1"],
        address2: json["address2"],
        city: json["city"],
        postcode: json["postcode"],
        telephone: json["telephone"],
        mobile: json["mobile"],
        gstno: json["gstno"],
        website: json["website"],
        profileId: json["profile_id"],
        logoImg: json["logo_img"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "role": role,
        "email": email,
        "ic_number": icNumber,
        "login_id": loginId,
        "login_name": loginName,
        "site_title": siteTitle,
        "address1": address1,
        "address2": address2,
        "city": city,
        "postcode": postcode,
        "telephone": telephone,
        "mobile": mobile,
        "gstno": gstno,
        "website": website,
        "profile_id": profileId,
        "logo_img": logoImg,
    };
}
