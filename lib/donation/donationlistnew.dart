import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sreeselvavinayagartemple/aa_model/donalistmode.dart';
import 'package:sreeselvavinayagartemple/homeScreen/homepage.dart';
import 'package:sreeselvavinayagartemple/profile/profilecheckPage.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';
import 'package:http/http.dart' as http;

import '../hall_booking/listouteventpage.dart';

class DonationNewlistPage extends StatefulWidget {
  const DonationNewlistPage({Key? key}) : super(key: key);

  @override
  State<DonationNewlistPage> createState() => _DonationNewlistPageState();
}

class _DonationNewlistPageState extends State<DonationNewlistPage> {
  List<int> selectedIndices = [];
  String? donationSetingId;

  late Future<Donationlistmodel> donationSettingList;
  TextEditingController amount = TextEditingController();
  TextEditingController namedonator = TextEditingController();
  TextEditingController phonenos = TextEditingController();
  TextEditingController icnumbers = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController address = TextEditingController();

  Future<Donationlistmodel> getDonationlist() async {
    try {
      final response = await http.get(Uri.parse(
          'https://rajamariammanapi.grasp.com.my/public/donation/donation_setting'));

      if (response.statusCode == 200) {
        print('Print checking response ${response.body}');
        return Donationlistmodel.fromJson(
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

  Future<void> postdonation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? loginId = prefs.getInt('loginId');
    if (loginId == null) {
      print('Controller or user data is null.');
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(
            'https://rajamariammanapi.grasp.com.my/public/donation/donation_customer_save'),
        body: jsonEncode({
          "user_id": loginId,
          "donation_setting_id": donationSetingId,
          "amount": amount.text,
          "name": namedonator.text,
          "email": email.text,
          "ic_number": icnumbers.text,
          "phone_no": phonenos.text,
          "address": address.text,
          "description": description.text,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print(response.body);
        final Map<String, dynamic> data = json.decode(response.body);
           BuildContext? Context = Get.context;

      // Show a SnackBar
      ScaffoldMessenger.of(Context!).showSnackBar(
        const SnackBar(content: Text("Donation successfully")),
      );
        Get.off(() => Homepage());
      } else {
        print('Failed to post donation. Status Code: ${response.statusCode}');
      }
    } catch (err) {
      print('Error: $err');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Donation not Successful')));
    }
  }

  @override
  void initState() {
    donationSettingList = getDonationlist();

    SharedPreferences.getInstance().then((prefs) {
      int? loginId = prefs.getInt('loginId');
      if (loginId != null) {
        setState(() {});
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfileNavigationCheck()),
        );
      }
    });
    super.initState();
  }

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Donationlistmodel>(
      future: donationSettingList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
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
        preferredSize: Size.fromHeight(kToolbarHeight + 10),
        child: AppBar(
          backgroundColor: Color(0xFF006CA7),
          title: Text('Cash Donation'),
      
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
                      // const Padding(
                      //   padding: EdgeInsets.all(8.0),
                      //   child: Text(
                      //     "Cash Donation",
                      //     style: TextStyle(fontSize: 20),
                      //   ),
                      // ),
                      GridView.count(
                        crossAxisCount: 3,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics:NeverScrollableScrollPhysics(),
                        children: List.generate(
                            snapshot.data!.data!.donationSettingList!.length ??
                                0, (index) {
                          return CustomGridTile(
                            imagePath: snapshot.data!.data!
                                    .donationSettingList![index].image ??
                                '',
                            name: snapshot.data!.data!
                                    .donationSettingList![index].name ??
                                '',
                            selected: selectedIndices.contains(index),
                            onSelect: (isSelected) {
                              setState(() {
                                if (isSelected) {
                                  donationSetingId = isSelected
                                      ? snapshot.data!.data!
                                          .donationSettingList![index].id
                                          .toString()
                                      : null;
                                  selectedIndices.add(index);
                                } else {
                                  selectedIndices.remove(index);
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
                                  color: const Color(0xFFE4F5FF),
                                  child: Column(
                                    children: [
                                      hGap10,
                                      ListTile(
                                        title: const Text('Amount'),
                                        subtitle: Container(
                                            height: 40,
                                            child: CustomRoundedTextField(
                                              controller: amount,
                                              labelText: '',
                                            )),
                                      ),
                                      ListTile(
                                        title: const Text('Name           '),
                                        subtitle: Container(
                                            height: 40,
                                            child: CustomRoundedTextField(
                                              controller: namedonator,
                                              labelText: '',
                                            )),
                                      ),
                                      ListTile(
                                        title: const Text('phone No     '),
                                        subtitle: Container(
                                            height: 40,
                                            child: CustomRoundedTextField(
                                              controller: phonenos,
                                              labelText: '',
                                            )),
                                      ),
                                      ListTile(
                                        title: const Text('Ic Number    '),
                                        subtitle: Container(
                                            height: 40,
                                            child: CustomRoundedTextField(
                                              controller: icnumbers,
                                              labelText: '',
                                            )),
                                      ),
                                      ListTile(
                                        title: const Text('Email             '),
                                        subtitle: Container(
                                            height: 40,
                                            child: CustomRoundedTextField(
                                              controller: email,
                                              labelText: '',
                                            )),
                                      ),
                                      ListTile(
                                        title: const Text('Address       '),
                                        subtitle: Container(
                                            height: 80,
                                            child: CustomRoundedTextField(
                                              controller: address,
                                              labelText: '',
                                              maxLines: 3,
                                            )),
                                      ),
                                      ListTile(
                                        title: const Text('Description       '),
                                        subtitle: Container(
                                            height: 80,
                                            child: CustomRoundedTextField(
                                              controller: description,
                                              labelText: '',
                                              maxLines: 3,
                                            )),
                                      ),
                                      hGap10,
                                    ],
                                  )),
                              hGap10,
                              SizedBox(
                                  height: 40,
                                  width: double.infinity,
                                  child: CustomElevatedButtons(
                                      child: const Text('Pay Now'),
                                      onPressed: () async {
                                        if (formkey.currentState!.validate()) {
                                          formkey.currentState!.save();
                                          await postdonation();
                                        }
                                      })),
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
          return const Scaffold(
            body: Center(
              child: Text('Data not available'),
            ),
          );
        }
      },
    );
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
                    width: MediaQuery.of(context).size.width * 0.26,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.imagePath),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(33),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
            const SizedBox(height: 5),
            Text(
              widget.name,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
