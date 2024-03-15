import 'dart:collection';
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
  Set<String> selectedBookingServices = Set<String>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: Color(0xFFE4F5FF),
        appBar: AppBar(
          title: Text('Selected Package'),
          backgroundColor:Color(0xFF006CA7),
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
                              image: AssetImage('assets/sv2.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      hGap15,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('List of Package Items',
                            style: TextStyle(fontSize: 22)),
                      ),
                    
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount:
                              1, // You might want to update this based on your actual data
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final HallAddonList addon =
                                hallAddonListData.data!.hallAddonList![index];

                            List<Widget> serviceWidgets = [];
                            double totalAmount = 0.0;
                            Set<String> uniqueServiceNames = HashSet<String>();

                            // Loop through hallAddonServiceList and add unique services
                            for (final String packageId
                                in widget.selectedPackageId.nonNulls) {
                              final HallAddonList selectedAddon =
                                  hallAddonListData.data!.hallAddonList!
                                      .firstWhere(
                                          (addon) => addon.id == packageId,
                                          orElse: () => HallAddonList());

                              // Move the set declaration inside the loop to reset for each package
                              for (final ServiceList service
                                  in selectedAddon.hallAddonServiceList ?? []) {
                                final String serviceName =
                                    service.serviceName ?? '';

                                if (!uniqueServiceNames.contains(serviceName)) {
                                  uniqueServiceNames.add(serviceName);

                                  serviceWidgets.add(
                                    Card(
                                      color:  Color(0xFFE4F5FF),
                                      child: ListTile(
                                        title: Text(serviceName),
                                        trailing:
                                            Text('RM${service.amount ?? ''}'),
                                      ),
                                    ),
                                  );

                                  totalAmount += service.amount ?? 0.0;
                                }
                              }
                            }

                            // Loop through bookingServiceList and add unique services in red
                            for (final ServiceList service
                                in hallAddonListData.data!.bookingServiceList ??
                                    []) {
                              final String serviceName =
                                  service.serviceName ?? '';

                              if (!uniqueServiceNames.contains(serviceName)) {
                                uniqueServiceNames.add(serviceName);
                                bool isSelected = selectedBookingServices
                                    .contains(serviceName);
                                serviceWidgets.add(
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          selectedBookingServices
                                              .remove(serviceName);
                                          totalAmount -= service.amount ?? 0.0;
                                        } else {
                                          selectedBookingServices
                                              .add(serviceName);
                                          totalAmount += service.amount ?? 0.0;
                                        }
                                      });
                                    },
                                    child: Card(
                                      color: isSelected
                                          ? const Color.fromARGB(255, 184, 237, 186)
                                          : const Color.fromARGB(255, 236, 159, 153),
                                      child: ListTile(
                                        title: Text(serviceName),
                                        trailing: 
                                             Text('RM${service.amount ?? ''}',style:TextStyle(color: Colors.white),)
                                            
                                      ),
                                    ),
                                  ),
                                );

                                // Update the total amount dynamically when the service is selected
                                if (isSelected) {
                                  totalAmount += service.amount ?? 0.0;
                                }
                              }
                            }

                            serviceWidgets.add(
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Container(
                                  color: Colors.blueGrey,
                                  child: Card(
                                    color: Colors.grey,
                                    child: ListTile(
                                      leading: Text(
                                        'Total Amount:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      trailing: Text(
                                        ' RM${totalAmount.toStringAsFixed(2)}',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  ...serviceWidgets,
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      hGap10,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Enter your Booking Address Details',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      hGap10,
                      Container(
                        child: Column(
                          children: [
                            Card(
                                color:  Color(0xFFE4F5FF),
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
            const Color(0xFF006CA7),), // Red color
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
