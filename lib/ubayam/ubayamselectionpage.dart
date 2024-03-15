import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sreeselvavinayagartemple/Annadhanam/annathanam_date_selection.dart';
import 'package:sreeselvavinayagartemple/aa_model/ubayamlistmodel.dart';
import 'package:http/http.dart' as http;
import 'package:sreeselvavinayagartemple/hall_booking/listouteventpage.dart';
import 'package:sreeselvavinayagartemple/profile/profilecheckPage.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UbayamSelectionPage extends StatefulWidget {
  const UbayamSelectionPage({super.key});

  @override
  State<UbayamSelectionPage> createState() => _UbayamSelectionPageState();
}

class _UbayamSelectionPageState extends State<UbayamSelectionPage> {
  List<int> selectedIndices = [];
  int? ubayamBookingId;
  String? ubayamSetingId;
  String? Ubayamurl;

  late Future<Ubayamlistdetailmodel> ubayamSettingList;

  TextEditingController amount = TextEditingController();
  TextEditingController namedonator = TextEditingController();
  TextEditingController phonenos = TextEditingController();
  TextEditingController icnumbers = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController familydetails = TextEditingController();
  TextEditingController relationship = TextEditingController();

  TextEditingController dateController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  List<Map<String, String>> familyFields = [];
  List<FamilyDetail> familyDetails = [];
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.red,
            hintColor: Colors.red,
            colorScheme: const ColorScheme.light(primary: Colors.red),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              colorScheme: ColorScheme.light(primary: Colors.red),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print('Formatted Date: $formattedDate');

      setState(() {
        selectedDate = pickedDate;
        dateController.text = formattedDate;
      });
    }
  }

  void initiatePayment() {
    const paymentUrl = 'https://ipay88-payment-url';
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => WebView(
            initialUrl: paymentUrl,
            javascriptMode: JavascriptMode.unrestricted,
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith(Ubayamurl!)) {
                final success = // ... parsing logic
                    Navigator.of(context).pop(); // Close web view
                // Update Flutter UI based on 'success'
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            })));
  }

  Future<Ubayamlistdetailmodel> geUbayamlist() async {
    try {
      final response = await http.get(Uri.parse(
          'https://rajamariammanapi.grasp.com.my/public/ubayam/ubayam_setting'));

      if (response.statusCode == 200) {
        print('Print checking response ${response.body}');
        return Ubayamlistdetailmodel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception(
            'Failed to load data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Network error occurred');
    }
  }

  Future<void> postubayam() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? loginId = prefs.getInt('loginId');
    if (loginId == null) {
      print('Controller or user data is null.');
      return;
    }

    try {
      List<Map<String, dynamic>> familyDetailsJson =
          familyDetails.map((detail) => detail.toJson()).toList();

      final response = await http.post(
        Uri.parse(
            'https://rajamariammanapi.grasp.com.my/public/ubayam/ubayam_customer_save'),
        body: jsonEncode({
          "user_id": loginId,
          "ubayam_setting_id": ubayamSetingId.toString(),
          "date": dateController.text,
          "name": namedonator.text,
          "email": email.text,
          "phone_no": phonenos.text,
          "ic_number": icnumbers.text,
          "address": address.text,
          "description": description.text,
          "amount": amount.text,
          "family_details": familyDetailsJson,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      print(familyDetailsJson);

      if (response.statusCode == 200) {
        print(response.body);
        final Map<String, dynamic> responseData = json.decode(response.body);
        ubayamBookingId = responseData['data']['ubayam_booking_id'];
        Ubayamurl = responseData['data']['url'];

        print(response.body);
        //final Map<String, dynamic> data = json.decode(response.body);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Donationed successfully')));
        initiatePayment();
        // String url =
        //     'https://rajamariammanapi.grasp.com.my/public/ubayam/ubayam_payment_process/$ubayamBookingId/$loginId';
        // await launch(url);
      } else {
        print('Failed to post donation. Status Code: ${response.statusCode}');
      }
    } catch (err) {
      print('Error: $err');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Donation not successfully')));
    }
  }

  Future<void> paymentprocess() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? loginId = prefs.getInt('loginId');
    if (loginId == null) {
      print('Controller or user data is null.');
      return;
    }

    try {
      final initialResponse = await http.post(
        Uri.parse(
            'https://rajamariammanapi.grasp.com.my/public/ubayam/ubayam_payment_process/$ubayamBookingId/$loginId'),
        headers: {'Content-Type': 'application/json'},
      );

      if (initialResponse.statusCode == 302) {
        String redirectedUrl = initialResponse.headers['location'] ?? '';

        final response = await http.get(
          Uri.parse(redirectedUrl),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          print('Payment process successful');
          print('Response: ${response.body}');
        } else {
          print(
              'Failed to process payment. Status Code: ${response.statusCode}');
        }
      } else {
        print(
            'Non-redirect response. Status Code ${initialResponse.statusCode}');
      }
    } catch (err) {
      print('Error during payment process: $err');
    }
  }

  @override
  void initState() {
    ubayamSettingList = geUbayamlist();

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

  final formkey = GlobalKey<FormState>();

  int selectedUbayamIndex = -1;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Ubayamlistdetailmodel>(
      future: ubayamSettingList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else if (snapshot.hasData) {
          return Form(
            key: formkey,
            child: Scaffold(
                backgroundColor: Color(0xFFE4F5FF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight +4),
        child: AppBar(
          backgroundColor: Color(0xFF006CA7),
          title: Text('Ubayam'),
      
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22)),
            ),
          ),
        ),
      ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                   
                      GridView.count(
                        crossAxisCount: 3,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: List.generate(
                            snapshot.data!.data!.ubayamSettingList!.length ?? 0,
                            (index) {
                          return CustomGridTile(
                            imagePath: snapshot.data!.data!
                                    .ubayamSettingList![index].image ??
                                '',
                            name: snapshot.data!.data!.ubayamSettingList![index]
                                    .name ??
                                '',
                            selected: index == selectedUbayamIndex,
                            onSelect: (isSelected) {
                              setState(() {
                                if (isSelected) {
                                  ubayamSetingId = snapshot
                                      .data!.data!.ubayamSettingList![index].id
                                      .toString();
                                  selectedUbayamIndex = index;
                                } else {
                                  ubayamSetingId = null;
                                  selectedUbayamIndex = -1;
                                }
                              });
                            },
                          );
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: [
                              Card(
                                  color:  Color(0xFFE4F5FF),
                                  child: Column(
                                    children: [
                                      hGap10,
                                      ListTile(
                                        title: Text('Select Date'),
                                        subtitle: CustomTextFormFeild2(
                                          controller: dateController,
                                          labelText: 'Date',
                                          onTap: () => _selectDate(context),
                                          surffixIcon: Icons.calendar_month,
                                        ),
                                      ),
                                      ListTile(
                                        title: Text('Amount'),
                                        subtitle: Container(
                                            height: 40,
                                            child: CustomRoundedTextFields(
                                              controller: amount,
                                              labelText: '',
                                              keyboardType:
                                                  TextInputType.number,
                                            )),
                                      ),
                                      ListTile(
                                        title: Text('Name           '),
                                        subtitle: Container(
                                            height: 40,
                                            child: CustomRoundedTextFields(
                                              controller: namedonator,
                                              labelText: '',
                                            )),
                                      ),
                                      ListTile(
                                        title: Text('phone No     '),
                                        subtitle: Container(
                                            height: 40,
                                            child: CustomRoundedTextFields(
                                              controller: phonenos,
                                              labelText: '',
                                              keyboardType:
                                                  TextInputType.number,
                                            )),
                                      ),
                                      ListTile(
                                        title: Text('Ic Number    '),
                                        subtitle: Container(
                                            height: 40,
                                            child: CustomRoundedTextFields(
                                              controller: icnumbers,
                                              labelText: '',
                                              keyboardType:
                                                  TextInputType.number,
                                            )),
                                      ),
                                      ListTile(
                                        title: Text('Email             '),
                                        subtitle: Container(
                                            height: 40,
                                            child: CustomRoundedTextFields(
                                              controller: email,
                                              labelText: '',
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                            )),
                                      ),
                                      ListTile(
                                        title: Text('Address       '),
                                        subtitle: Container(
                                            height: 80,
                                            child: CustomRoundedTextFields(
                                              controller: address,
                                              labelText: '',
                                              maxLines: 3,
                                            )),
                                      ),
                                      ListTile(
                                        title: Text('Description'),
                                        subtitle: Container(
                                            height: 80,
                                            child: CustomRoundedTextFields(
                                              controller: description,
                                              labelText: '',
                                              maxLines: 3,
                                            )),
                                      ),
                                      ListBody(
                                        mainAxis: Axis.vertical,
                                        children: familyDetails.map((detail) {
                                          return FamilyDetailWidget(
                                            familyDetail: detail,
                                            onChanged:
                                                (FamilyDetail updatedDetail) {
                                              setState(() {
                                                familyDetails[familyDetails
                                                        .indexOf(detail)] =
                                                    updatedDetail;
                                              });
                                            },
                                          );
                                        }).toList(),
                                      ),
                                      FloatingActionButton(
                                        onPressed: () {
                                          setState(() {
                                            familyDetails.add(FamilyDetail(
                                                name: "",
                                                relationship: "Mother"));
                                          });
                                        },
                                        tooltip: 'Add Family Member',
                                        child: Icon(Icons.add),
                                      ),
                                      hGap10,
                                    ],
                                  )),
                              hGap10,
                              SizedBox(
                                  height: 40,
                                  width: double.infinity,
                                  child: CustomElevatedButtons(
                                      child: Text('confirm'),
                                      onPressed: () async {
                                        if (formkey.currentState!.validate()) {
                                          formkey.currentState!.save();
                                          CircularProgressIndicator();
                                          await postubayam();
                                        }
                                      })),
                              hGap40,
                              hGap40,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Text('Data not available'),
            ),
          );
        }
      },
    );
  }
}

class FamilyDetail {
  String name = "";
  String relationship = "Mother";

  FamilyDetail({required this.name, required this.relationship});
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'relationship': relationship,
    };
  }
}

class FamilyDetailWidget extends StatelessWidget {
  final FamilyDetail familyDetail;
  final ValueChanged<FamilyDetail> onChanged;

  FamilyDetailWidget({required this.familyDetail, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        initialValue: familyDetail.name,
        onChanged: (value) {
          familyDetail.name = value;
          onChanged(familyDetail);
        },
        decoration: InputDecoration(labelText: 'Name'),
      ),
      subtitle: DropdownButtonFormField<String>(
        value: familyDetail.relationship,
        onChanged: (value) {
          familyDetail.relationship = value!;
          onChanged(familyDetail);
        },
        items: ["Mother", "Father", "Sister", "Brother"]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: InputDecoration(labelText: 'Relationship'),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return familyDetail.toJson();
  }
}

class CustomGridTile extends StatefulWidget {
  final String imagePath;
  final String name;
  final Function(bool) onSelect;
  final bool selected;

  const CustomGridTile({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.onSelect,
    required this.selected,
  }) : super(key: key);

  @override
  State<CustomGridTile> createState() => _CustomGridTileState();
}

class _CustomGridTileState extends State<CustomGridTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onSelect(!widget.selected);
        });
      },
      child: GridTile(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.28,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.imagePath),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      value: widget.selected,
                      onChanged: (value) {
                        setState(() {
                          widget.onSelect(value ?? false);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
         
            Text(
              widget.name,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
         
          ],
        ),
      ),
    );
  }
}

class CustomRoundedTextFields extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final int? maxLines;
  final TextInputType keyboardType;
  const CustomRoundedTextFields({
    Key? key,
    required this.controller,
    required this.labelText,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter Member Name';
          }
          return null;
        },
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
