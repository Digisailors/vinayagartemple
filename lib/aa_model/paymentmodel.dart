

import 'dart:convert';

Paymentscreenmodel paymentscreenmodelFromJson(String str) => Paymentscreenmodel.fromJson(json.decode(str));

String paymentscreenmodelToJson(Paymentscreenmodel data) => json.encode(data.toJson());

class Paymentscreenmodel {
    bool? success;
    Data? data;
    String? message;

    Paymentscreenmodel({
        this.success,
        this.data,
        this.message,
    });

    factory Paymentscreenmodel.fromJson(Map<String, dynamic> json) => Paymentscreenmodel(
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
    List<TempDetail>? tempDetails;
    AnnathanamDetails? annathanamDetails;
    List<AnnathanamItemDetail>? annathanamItemDetails;
    bool? status;
    String? errorMsg;

    Data({
        this.tempDetails,
        this.annathanamDetails,
        this.annathanamItemDetails,
        this.status,
        this.errorMsg,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        tempDetails: json["temp_details"] == null ? [] : List<TempDetail>.from(json["temp_details"]!.map((x) => TempDetail.fromJson(x))),
        annathanamDetails: json["annathanam_details"] == null ? null : AnnathanamDetails.fromJson(json["annathanam_details"]),
        annathanamItemDetails: json["annathanam_item_details"] == null ? [] : List<AnnathanamItemDetail>.from(json["annathanam_item_details"]!.map((x) => AnnathanamItemDetail.fromJson(x))),
        status: json["status"],
        errorMsg: json["error_msg"],
    );

    Map<String, dynamic> toJson() => {
        "temp_details": tempDetails == null ? [] : List<dynamic>.from(tempDetails!.map((x) => x.toJson())),
        "annathanam_details": annathanamDetails?.toJson(),
        "annathanam_item_details": annathanamItemDetails == null ? [] : List<dynamic>.from(annathanamItemDetails!.map((x) => x.toJson())),
        "status": status,
        "error_msg": errorMsg,
    };
}

class AnnathanamDetails {
    String? id;
    DateTime? date;
    String? refNo;
    String? name;
    String? phoneNo;
    String? slotTime;
    String? riceTypeId;
    String? riceTypeName;
    String? riceCategoryId;
    String? riceCategoryName;
    String? kurumaId;
    String? kurumaName;
    String? amount;
    String? noOfPax;
    String? totalAmount;
    String? paymentMode;

    AnnathanamDetails({
        this.id,
        this.date,
        this.refNo,
        this.name,
        this.phoneNo,
        this.slotTime,
        this.riceTypeId,
        this.riceTypeName,
        this.riceCategoryId,
        this.riceCategoryName,
        this.kurumaId,
        this.kurumaName,
        this.amount,
        this.noOfPax,
        this.totalAmount,
        this.paymentMode,
    });

    factory AnnathanamDetails.fromJson(Map<String, dynamic> json) => AnnathanamDetails(
        id: json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        refNo: json["ref_no"],
        name: json["name"],
        phoneNo: json["phone_no"],
        slotTime: json["slot_time"],
        riceTypeId: json["rice_type_id"],
        riceTypeName: json["rice_type_name"],
        riceCategoryId: json["rice_category_id"],
        riceCategoryName: json["rice_category_name"],
        kurumaId: json["kuruma_id"],
        kurumaName: json["kuruma_name"],
        amount: json["amount"],
        noOfPax: json["no_of_pax"],
        totalAmount: json["total_amount"],
        paymentMode: json["payment_mode"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "ref_no": refNo,
        "name": name,
        "phone_no": phoneNo,
        "slot_time": slotTime,
        "rice_type_id": riceTypeId,
        "rice_type_name": riceTypeName,
        "rice_category_id": riceCategoryId,
        "rice_category_name": riceCategoryName,
        "kuruma_id": kurumaId,
        "kuruma_name": kurumaName,
        "amount": amount,
        "no_of_pax": noOfPax,
        "total_amount": totalAmount,
        "payment_mode": paymentMode,
    };
}

class AnnathanamItemDetail {
    String? id;
    String? vegetableId;
    String? vegetableName;

    AnnathanamItemDetail({
        this.id,
        this.vegetableId,
        this.vegetableName,
    });

    factory AnnathanamItemDetail.fromJson(Map<String, dynamic> json) => AnnathanamItemDetail(
        id: json["id"],
        vegetableId: json["vegetable_id"],
        vegetableName: json["vegetable_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vegetable_id": vegetableId,
        "vegetable_name": vegetableName,
    };
}

class TempDetail {
    int? id;
    String? name;
    String? nameTamil;
    String? address1;
    String? address2;
    String? city;
    String? postcode;
    String? telephone;
    String? regno;
    String? mobile;
    String? email;
    String? gstno;
    String? faxNo;
    String? website;
    String? bankid;
    int? hallRemind;
    int? ubayamCourtesyGraceAmount;
    int? donationCourtesyGraceAmount;
    String? image;
    String? arImage;

    TempDetail({
        this.id,
        this.name,
        this.nameTamil,
        this.address1,
        this.address2,
        this.city,
        this.postcode,
        this.telephone,
        this.regno,
        this.mobile,
        this.email,
        this.gstno,
        this.faxNo,
        this.website,
        this.bankid,
        this.hallRemind,
        this.ubayamCourtesyGraceAmount,
        this.donationCourtesyGraceAmount,
        this.image,
        this.arImage,
    });

    factory TempDetail.fromJson(Map<String, dynamic> json) => TempDetail(
        id: json["id"],
        name: json["name"],
        nameTamil: json["name_tamil"],
        address1: json["address1"],
        address2: json["address2"],
        city: json["city"],
        postcode: json["postcode"],
        telephone: json["telephone"],
        regno: json["regno"],
        mobile: json["mobile"],
        email: json["email"],
        gstno: json["gstno"],
        faxNo: json["fax_no"],
        website: json["website"],
        bankid: json["bankid"],
        hallRemind: json["hall_remind"],
        ubayamCourtesyGraceAmount: json["ubayam_courtesy_grace_amount"],
        donationCourtesyGraceAmount: json["donation_courtesy_grace_amount"],
        image: json["image"],
        arImage: json["ar_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name_tamil": nameTamil,
        "address1": address1,
        "address2": address2,
        "city": city,
        "postcode": postcode,
        "telephone": telephone,
        "regno": regno,
        "mobile": mobile,
        "email": email,
        "gstno": gstno,
        "fax_no": faxNo,
        "website": website,
        "bankid": bankid,
        "hall_remind": hallRemind,
        "ubayam_courtesy_grace_amount": ubayamCourtesyGraceAmount,
        "donation_courtesy_grace_amount": donationCourtesyGraceAmount,
        "image": image,
        "ar_image": arImage,
    };

  fromJson(decode) {}
}
