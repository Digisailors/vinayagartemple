import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sreeselvavinayagartemple/aa_controller/session_Controller.dart';
import 'package:sreeselvavinayagartemple/aa_model/halladdonmodel.dart';
import 'package:sreeselvavinayagartemple/profile/profilecheckPage.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';
import 'package:http/http.dart' as http;

class SelectedEventPage extends StatefulWidget {
  final DateTime? selectedDate;
  final List<String> SeletedslotId;

  final List<String?> selectedPackageId;
  SelectedEventPage({
    super.key,
    this.selectedDate,
    required this.selectedPackageId,
    required this.SeletedslotId,
  });

  @override
  State<SelectedEventPage> createState() => _SelectedEventPageState();
}

class _SelectedEventPageState extends State<SelectedEventPage> {
 
  double totalAmount = 0.0;
  SessionController? controller;
  List<HallAddonList>? hallAddonList;
  List<String?> selectedServices = [];
  TextEditingController eventname = TextEditingController();
  TextEditingController bookingname = TextEditingController();
  TextEditingController bookingaddress = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController icnumber = TextEditingController();
  TextEditingController email = TextEditingController();

  Future<Halladdonlistmodel> gethalladdonlist() async {
    final response = await http.get(Uri.parse(
        'https://rajamariammanapi.grasp.com.my/public/booking/hall_addonn'));
    if (response.statusCode == 200) {
      print('Print checking response${response.body}');
      return Halladdonlistmodel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<void> Posthallpayment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? loginId = prefs.getInt('loginId');
    if (loginId == null) {
      print('Controller or user data is null.');
      return;
    }
    try {
      final response = await http.post(
        Uri.parse(
            'https://rajamariammanapi.grasp.com.my/public/booking/hall_customer_save'),
        body: jsonEncode({
          "user_id": loginId.toString(),
          "date": widget.selectedDate.toString(),
          "slot_details": widget.SeletedslotId.toString(),
          "service_details": selectedServices.toList(),
          "event_name": eventname.text,
          "name": bookingname.text,
          "address": bookingaddress.text,
          "city": city.text,
          "phone_no": phoneno.text,
          "ic_number": icnumber.text,
          "email": email.text,
          "total_amount": hallAddonList![0].amount ?? '',
        }),
        headers: {'Content-Type': 'application/json'},
      );
      print(loginId.toString());
      print(
        widget.selectedDate.toString(),
      );
      print(
        widget.SeletedslotId.toString(),
      );
      print(
        eventname.text,
      );
      print(
        bookingaddress.text,
      );

      print(
        'list of values${selectedServices.toList()}',
      );
      if (response.statusCode == 200) {
      } else {
        print('Error: ${response.statusCode}, ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }




  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      int? loginId = prefs.getInt('loginId');
      if (loginId != null) {
        setState(() {});
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileNavigationCheck()),
        );
      }
    });
    super.initState();
  }


 
  // double calculateTotalPay() {
  //   double totalPay = 0.0;

  //   for (String? serviceId in selectedServices) {
  //     HallAddonServiceList? service = findServiceById(serviceId);
  //     if (service != null) {
  //       totalPay += double.parse(service.amount.toString()?? '0.0');
  //     }
  //   }

  //   return totalPay;
  // }

 
  // HallAddonServiceList? findServiceById(String? serviceId) {
  //   var hallAddonListData;
  //   for (HallAddonList addon in hallAddonListData.data?.hallAddonList ?? []) {
  //     for (HallAddonServiceList service
  //         in addon.hallAddonServiceList ?? []) {
  //       if (service.amount == serviceId) {
  //         return service;
  //       }
  //     }
  //   }
  //   return null;
  // }
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 239, 196),
        appBar: AppBar(
          title: Text('Baby shower'),
          backgroundColor: Colors.red,
        ),
        body: FutureBuilder<Halladdonlistmodel>(
          future: gethalladdonlist(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              Halladdonlistmodel hallAddonListData = snapshot.data!;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 5,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/september.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      hGap15,
                      Text('List of Package Items',
                          style: TextStyle(fontSize: 22)),
                      hGap10,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount:
                              hallAddonListData.data?.hallAddonList?.length ??
                                  0,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final HallAddonList addon =
                                hallAddonListData.data!.hallAddonList![index];

                            if (widget.selectedPackageId.contains(addon.id)) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${addon.name}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    ListView.builder(
                                      itemCount:
                                          addon.hallAddonServiceList?.length ??
                                              0,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, serviceIndex) {
                                        final HallAddonServiceList service =
                                            addon.hallAddonServiceList![
                                                serviceIndex];
                                        bool isServiceSelected =
                                            selectedServices
                                                .contains(service.serviceId);
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (isServiceSelected) {
                                                selectedServices
                                                    .remove(service.serviceId);
                                                     totalAmount -= service.amount!;
                                              } else {
                                                selectedServices.add(service
                                                    .serviceId
                                                    .toString());
                                                   totalAmount += service.amount!;
                                              }
                                            });
                                          },
                                          child: Card(
                                            color: isServiceSelected
                                                ? Colors.red
                                                : Color.fromARGB(
                                                    115, 227, 222, 222),
                                            child: ListTile(
                                              title: Text(
                                                  service.serviceName ?? ''),
                                              trailing: Text(
                                                  'RM${service.amount ?? ''}'),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(height: 10),
                                     Card(
                                      color: const Color.fromARGB(255, 184, 243, 214),
                                       child: SizedBox(
                                        height: 50,
                                         child: Center(
                                           child: ListTile(leading: Text('Amout'),
                                           trailing:    Text(
                                            '${addon.amount}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                                                               ) ,),
                                         )
                                     
                                       ),
                                     ),
                                  ],
                                ),
                              );
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                        ),
                      ),
                      hGap10,
                      Text(
                        'Enter your Booking Address Details',
                        style: TextStyle(fontSize: 18),
                      ),
                      hGap10,
                      Container(
                        child: Column(
                          children: [
                            Card(
                                color: Colors.redAccent,
                                child: Column(
                                  children: [
                                    hGap10,
                                    ListTile(
                                      title: Text('Event Name'),
                                      subtitle: Container(
                                          height: 40,
                                          child: CustomRoundedTextField(
                                            controller: eventname,
                                            labelText: '',
                                          )),
                                    ),
                                    ListTile(
                                      title: Text('Name           '),
                                      subtitle: Container(
                                          height: 40,
                                          child: CustomRoundedTextField(
                                            controller: bookingname,
                                            labelText: '',
                                          )),
                                    ),
                                    ListTile(
                                      title: Text('Address       '),
                                      subtitle: Container(
                                          height: 80,
                                          child: CustomRoundedTextField(
                                            controller: bookingaddress,
                                            labelText: '',
                                            maxLines: 3,
                                          )),
                                    ),
                                    ListTile(
                                      title: Text('phone No     '),
                                      subtitle: Container(
                                          height: 40,
                                          child: CustomRoundedTextField(
                                            controller: phoneno,
                                            labelText: '',
                                          )),
                                    ),
                                    ListTile(
                                      title: Text('Ic Number    '),
                                      subtitle: Container(
                                          height: 40,
                                          child: CustomRoundedTextField(
                                            controller: icnumber,
                                            labelText: '',
                                          )),
                                    ),
                                    ListTile(
                                      title: Text('Email             '),
                                      subtitle: Container(
                                          height: 40,
                                          child: CustomRoundedTextField(
                                            controller: email,
                                            labelText: '',
                                          )),
                                    ),
                                    hGap10,
                                  ],
                                ))
                          ],
                        ),
                      ),
                      hGap20,
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        margin: EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                          color: thirdColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Payment Details',
                              style: h2,
                            ),
                            hGap10,
                            Divider(
                              color: const Color.fromARGB(97, 231, 205, 205),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Pay',
                                  style: h4,
                                ),
                                 Text('RM${totalAmount}',style: h4,),
                                
                              //     Text(
                              //   'RM${calculateTotalPay().toStringAsFixed(2)}',
                              //   style: h4,
                              // )
                              ],
                            ),
                          ],
                        ),
                      ),
                      hGap15,
                      Container(
                        width: double.infinity,
                        height: 40,
                        child: CustomElevatedButtons(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              CircularProgressIndicator();
                              await Posthallpayment();
                            }
                          },
                          child: Text('Pay Now'),
                        ),
                      ),
                      hGap15,
                    ],
                  ),
                ),
              );
            } else {
              return Text('No data available');
            }
          },
        ),
      ),
    );
  }
}

class CustomRoundedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final int? maxLines;

  const CustomRoundedTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
          labelStyle: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class CustomElevatedButtons extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget? child;

  const CustomElevatedButtons({Key? key, this.onPressed, this.child})
      : super(key: key);

  @override
  State<CustomElevatedButtons> createState() => _CustomElevatedButtonsState();
}

class _CustomElevatedButtonsState extends State<CustomElevatedButtons> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFFFF0000)), // Red color
        elevation: MaterialStateProperty.all<double>(4),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(41),
          ),
        ),
      ),
      child: widget.child,
    );
  }
}
