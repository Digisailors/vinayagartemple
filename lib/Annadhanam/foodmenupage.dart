import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sreeselvavinayagartemple/Annadhanam/annathanam_date_selection.dart';
import 'package:sreeselvavinayagartemple/Annadhanam/annathanampaymentmode.dart';
import 'package:sreeselvavinayagartemple/aa_model/kurumamodel.dart';
import 'package:http/http.dart' as http;
import 'package:sreeselvavinayagartemple/aa_model/ricecatogrymodel.dart';
import 'package:sreeselvavinayagartemple/aa_model/vegetablesmodel.dart';
import 'package:sreeselvavinayagartemple/aa_model/whitericemodel.dart';
import 'package:sreeselvavinayagartemple/profile/profilecheckPage.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';

import '../aa_controller/session_Controller.dart';

Future<Kurumalist> getKurumaApi() async {
  final response = await http.get(Uri.parse(
      'https://rajamariammanapi.grasp.com.my/public/annathanam/kuruma_type'));

  if (response.statusCode == 200) {
    return Kurumalist.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Ricecategaerymodel> getRicecatgeryApi() async {
  final response = await http.get(Uri.parse(
      'https://rajamariammanapi.grasp.com.my/public/annathanam/rice_category'));
  if (response.statusCode == 200) {
    return Ricecategaerymodel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}

Future<WhiteRicemodel> getwhitericeApi() async {
  final response = await http.get(Uri.parse(
      'https://rajamariammanapi.grasp.com.my/public/annathanam/rice_type'));
  if (response.statusCode == 200) {
    return WhiteRicemodel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Vegetablesmodel> getvegtablesApi() async {
  final response = await http.get(Uri.parse(
      'https://rajamariammanapi.grasp.com.my/public/annathanam/vegetables'));
  if (response.statusCode == 200) {
    return Vegetablesmodel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}

class FoodMenuPage extends StatefulWidget {
  final DateTime selectedDate;
  final List<int>? dropdownValues;
  final int? selectedMealIndex;

  FoodMenuPage(
      {Key? key,
      required this.selectedDate,
      required this.dropdownValues,
      required this.selectedMealIndex})
      : super(key: key);

  @override
  State<FoodMenuPage> createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  SessionController? controller;
  late Future<Kurumalist> kurumaItems;
  late Future<Ricecategaerymodel> ricecategorylists;
  late Future<WhiteRicemodel> whitericeItems;
  late Future<Vegetablesmodel> vegetableItems;
  bool isLoading = true;
  int? selectedDropdownValue;
  int? selectedRadioValue;
  int? selectedRadioValue1;
  int? selectedRadioValue2;
  int? selectedRadioValue3;
  int? AnnathanamId;

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
    controller = Get.put(SessionController());
    loadData();
  }
    Future<void> loadData() async {
    try {
      kurumaItems = getKurumaApi();
      ricecategorylists = getRicecatgeryApi();
      whitericeItems = getwhitericeApi();
      vegetableItems = getvegtablesApi();

      await Future.wait([kurumaItems, ricecategorylists, whitericeItems, vegetableItems]);

      setState(() {
        isLoading = false; 
      });
    } catch (error) {
      print('Error loading data: $error');
   
    }
  }
bool validateBooking() {
  if (selectedDropdownValue == null) {
    showSnackBarMessage('Please select a package.');
    return false;
  }
  if (selectedRadioValue == null) {
    showSnackBarMessage('Please select a Kuruma item.');
    return false;
  }
  if (selectedRadioValue1 == null) {
    showSnackBarMessage('Please select a Rice category.');
    return false;
  }
  if (selectedRadioValue2 == null) {
    showSnackBarMessage('Please select a Rice type.');
    return false;
  }
  if (selectedRadioValue3 == null) {
    showSnackBarMessage('Please select a Poriyal.');
    return false;
  }
  return true;
}
void showSnackBarMessage(String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    ),
  );
}
  Future<void> bookNow() async {

     if (!validateBooking()) {
    return;
  }
    var slotTime;

    if (widget.selectedMealIndex == 1) {
      slotTime = "Lunch";
    } else if (widget.selectedMealIndex == 0) {
      slotTime = "Breakfast";
    } else if (widget.selectedMealIndex == 2) {
      slotTime = "Dinner";
    }
    if (controller!.user!.data!.userDetails != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? loginId = prefs.getInt('loginId');
      print(controller!.user!.data!.userDetails!.loginName);
      print(loginId);
      print(
        widget.selectedDate.toLocal().toString(),
      );
      print(slotTime);
      print(
        selectedRadioValue1.toString(),
      );
      print(
        selectedRadioValue.toString(),
      );
      print(selectedRadioValue2.toString());
      print(selectedDropdownValue.toString());

      var body = {
        "date": widget.selectedDate.toString(),
        "name": controller!.user!.data!.userDetails!.loginName,
        "phone_no": controller!.user!.data!.userDetails!.mobile,
        "slot_time": slotTime,
        "rice_category_id": selectedRadioValue1,
        "kuruma_id": selectedRadioValue.toString(),
        "rice_type_id": selectedRadioValue2.toString(),
        "no_of_pax": selectedDropdownValue.toString(),
        "vegetables_id": [selectedRadioValue3],
        "user_id":loginId,
      };

      try {
        final response = await http.post(
          Uri.parse(
              'https://rajamariammanapi.grasp.com.my/public/annathanam/annathanam_save'),
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          Map<String, dynamic> responseData = json.decode(response.body);
          AnnathanamId = responseData['data']['annathanam_id'];
          print('Booking successful. AnnathanamId: $AnnathanamId');
           ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Booking successful'),
            duration: Duration(seconds: 3), 
          ),
        );
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return PaymentOptionsDialog(
                  annathanamId: AnnathanamId!.toString());
            },
          );
        } else {
        
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error}'),
          
          ),
        );
        }
      } catch (error) {
        print('Error: $error');
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $error'),
       
        ),
      );
      }
    } else {
      print('Controller or user data is null.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Color(0xFFE4F5FF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 10),
        child: AppBar(
          backgroundColor: Color(0xFF006CA7),
          title: Text('Annathanam'),
      
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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListTile(
                leading: AutoSizeText(
                  'Package',
                  style: TextStyle(fontSize: 20),
                ),
                trailing: SizedBox(
                  height: 60,
                  width: 110,
                  child: DropdownButtonFormField<int>(
                    value: selectedDropdownValue,
                    items: widget.dropdownValues?.map((value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList() ??
                        [],
                    onChanged: (value) {
                      setState(() {
                        selectedDropdownValue = value;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 345,
                child: const AutoSizeText(
                  'Minimum 100 px',
                  textAlign: TextAlign.right,
                ),
              ),
              hGap10,
              AutoSizeText(
                'Kuruma & vegetables Items',
                maxFontSize: 20,
                minFontSize: 16,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              hGap10,
              FutureBuilder<Kurumalist>(
                future: kurumaItems,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          snapshot.data?.data?.kurumaTypeList?.length ?? 0,
                      itemBuilder: (context, index) {
                        var kurumaType =
                            snapshot.data!.data!.kurumaTypeList![index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: ListTile(
                            title: AutoSizeText(kurumaType.nameEng ?? ''),
                            subtitle: AutoSizeText(kurumaType.nameTamil ?? ''),
                            trailing: Radio(
                              value: int.tryParse(kurumaType.id ?? ''),
                              groupValue: selectedRadioValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedRadioValue = value;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Text('No data available');
                  }
                },
              ),
              hGap10,
              AutoSizeText(
                'Rice Items',
                maxFontSize: 20,
                minFontSize: 16,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              hGap10,
              FutureBuilder<Ricecategaerymodel>(
                future: ricecategorylists,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          snapshot.data!.data!.riceCategoryList?.length ?? 0,
                      itemBuilder: (context, index) {
                        var ricecategorytype =
                            snapshot.data!.data!.riceCategoryList![index];
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 5,
                          child: ListTile(
                            title: AutoSizeText(ricecategorytype.nameEng ?? ''),
                            subtitle:
                                AutoSizeText(ricecategorytype.nameTamil ?? ''),
                            trailing: Radio(
                              value: int.tryParse(ricecategorytype.id ?? ''),
                              groupValue: selectedRadioValue1,
                              onChanged: (value) {
                                setState(() {
                                  selectedRadioValue1 = value;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Text('No data available');
                  }
                },
              ),
              hGap10,
              AutoSizeText(
                'Variety Rice Items',
                maxFontSize: 20,
                minFontSize: 16,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              hGap10,
              FutureBuilder<WhiteRicemodel>(
                future: whitericeItems,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.data!.riceTypeList?.length ?? 0,
                      itemBuilder: (context, index) {
                        var whitetypelist =
                            snapshot.data!.data!.riceTypeList![index];
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 5,
                          child: ListTile(
                            title: AutoSizeText(whitetypelist.name ?? ''),
                        
                            trailing: Radio(
                              value: int.tryParse(whitetypelist.id ?? ''),
                              groupValue: selectedRadioValue2,
                              onChanged: (value) {
                                setState(() {
                                  selectedRadioValue2 = value;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Text('No data available');
                  }
                },
              ),
              hGap10,
              AutoSizeText(
                'Poriyals',
                maxFontSize: 20,
                minFontSize: 16,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              hGap10,
              FutureBuilder<Vegetablesmodel>(
                future: vegetableItems,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    print(
                        'testing length${snapshot.data!.data!.vegetableList?.length}');
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          snapshot.data!.data!.vegetableList?.length ?? 0,
                      itemBuilder: (context, index) {
                        var veglist =
                            snapshot.data!.data!.vegetableList![index];
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 5,
                          child: ListTile(
                            title: AutoSizeText(veglist.nameEng ?? ''),
                            subtitle: AutoSizeText(veglist.nameTamil ?? ''),
                            trailing: Radio(
                              value: int.tryParse(veglist.id ?? ''),
                              groupValue: selectedRadioValue3,
                              onChanged: (value) {
                                setState(() {
                                  selectedRadioValue3 = value;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return AutoSizeText('No data available');
                  }
                },
              ),
              hGap10,
              CustomElevatedButton(
                onPressed: bookNow,
                buttonText: 'Book Now',
              ),
              hGap10,
            ],
          ),
        ),
      ),
    );
  }
}
