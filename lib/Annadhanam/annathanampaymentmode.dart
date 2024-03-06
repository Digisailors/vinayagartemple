import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sreeselvavinayagartemple/Annadhanam/printscreen.dart';
import 'package:sreeselvavinayagartemple/aa_controller/session_Controller.dart';
import 'package:http/http.dart' as http;
import 'package:sreeselvavinayagartemple/aa_model/paymentmodel.dart';
import 'package:sreeselvavinayagartemple/homeScreen/homepage.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';

class PaymentOptionsDialog extends StatefulWidget {
  final String annathanamId;

  PaymentOptionsDialog({required this.annathanamId});

  @override
  State<PaymentOptionsDialog> createState() => _PaymentOptionsDialogState();
}

class _PaymentOptionsDialogState extends State<PaymentOptionsDialog> {
  SessionController? controller;

  Future<void> paymentBooking() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? loginId = prefs.getInt('loginId');
    if (loginId == null) {
      print('Controller or user data is null.');
      return;
    }

    var body = {
      "annathanam_id": widget.annathanamId,
      "payment_mode": "cash",
      "user_id": loginId,
    };

    try {
      final response = await http.post(
        Uri.parse(
            'https://rajamariammanapi.grasp.com.my/public/annathanam/annathanam_payment_process'),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('id check ${widget.annathanamId}');
        print(loginId);

        final printTicketResponse = await http.post(
          Uri.parse(
              'https://rajamariammanapi.grasp.com.my/public/annathanam/print_ticket'),
          body: jsonEncode(
              {"annathanam_id": widget.annathanamId, "user_id": loginId}),
          headers: {'Content-Type': 'application/json'},
        );

        if (printTicketResponse.statusCode == 200) {
          print('Print Ticket Response: ${printTicketResponse.body}');
          final printTicketModel =
              paymentscreenmodelFromJson(printTicketResponse.body);
          final tempDetails = printTicketModel.data?.tempDetails;
          final annathanamDetails = printTicketModel.data?.annathanamDetails;

          if (tempDetails != null &&
              tempDetails.isNotEmpty &&
              annathanamDetails != null) {
            Get.to(() => PrintScreenpage(
                tempDetail: tempDetails[0],
                annathanamDetails: annathanamDetails));
          } else {
            print('Error: Temp details or Annathanam details are empty');
          }
        } else {
          print(
              'Error: ${printTicketResponse.statusCode}, ${printTicketResponse.body}');
        }
      } else {
        print('Error: ${response.statusCode}, ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void initState() {
    super.initState();
    controller = Get.put(SessionController());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Thank you for booking'),
      content: Container( 
        height: 100,
        child: Column(
          children: [
                Text('Cash on Delivery'),
                hGap20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
            

                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    paymentBooking();
                   // Get.to(()=>Homepage());
                  },
                  child: Text('yes', style: TextStyle(color: Colors.red)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                      Get.to(()=>Homepage());
                  },
                  child: Text('No', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  
}
