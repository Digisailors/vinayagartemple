import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sreeselvavinayagartemple/aa_model/halladdonmodel.dart';
import 'package:sreeselvavinayagartemple/Annadhanam/annathanam_date_selection.dart';

import 'package:sreeselvavinayagartemple/hall_booking/listouteventpage.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';
import 'package:http/http.dart' as http;

import '../aa_model/halldateselectionmodel.dart';

class HallDateSectionPage extends StatefulWidget {
  HallDateSectionPage({Key? key}) : super(key: key);

  @override
  _HallDateSectionPageState createState() => _HallDateSectionPageState();
}

class _HallDateSectionPageState extends State<HallDateSectionPage> {
  DateTime? selectedSlotDate;

  String? selectedPackageImagePath;
  List<String> selectedPackageIds = [];
  List<String> selectedSlots = [];
//int?selectedSlotid;
  late Future<Halladdonlistmodel> hallAddonList;

  TextEditingController dateController = TextEditingController();

  Hallslotdateselectionmodel? hallslotdateselectionmodel;
  DateTime selectedDate = DateTime.now();

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
        selectedSlotDate = pickedDate;
      });
    }
  }

  Future<void> halldatechoose(DateTime selectedDate) async {
    final apiUrl =
        'https://rajamariammanapi.grasp.com.my/public/booking/hall_fetched_date_slot';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({"date": selectedDate.toIso8601String()}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('Print${response.body}');
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          hallslotdateselectionmodel =
              Hallslotdateselectionmodel.fromJson(data);
        });
      } else {
        print(" ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

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

  @override
  void initState() {
    halldatechoose(selectedDate);
    hallAddonList = gethalladdonlist();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE4F5FF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 10),
        child: AppBar(
          backgroundColor: Color(0xFF006CA7),
          title: Text('Hall'),
        
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
                child: Container(
              width: double.infinity,
              color: Color(0xFFE4F5FF),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Date',
                      style: TextStyle(fontSize: 18),
                    ),
                    hGap10,
                    CustomTextFormFeild2(
                      controller: dateController,
                      labelText: 'Date',
                      onTap: () => _selectDate(context),
                      surffixIcon: Icons.calendar_month,
                    ),
                    hGap10,
                    Text(
                      'Choose Slot',
                      style: TextStyle(fontSize: 18),
                    ),
                    hGap10,
                    hallslotdateselectionmodel != null &&
                            hallslotdateselectionmodel!
                                .data!.hallbookingSlotList!.isNotEmpty
                        ? SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                hallslotdateselectionmodel!
                                    .data!.hallbookingSlotList!.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    int slotId = hallslotdateselectionmodel!
                                        .data!
                                        .hallbookingSlotList![index]
                                        .slotId!;
                                    print('Tapped Slot ID: $slotId');
                                    setState(() {
                                      String slotIdString = slotId.toString();
                                      if (selectedSlots
                                          .contains(slotIdString)) {
                                        selectedSlots.remove(slotIdString);
                                      } else {
                                        selectedSlots.add(slotIdString);
                                      }
                                    });
                                    print('After Selection: $selectedSlots');
                                  },
                                  child: Card(
                                    color: selectedSlots.contains(
                                            hallslotdateselectionmodel!
                                                .data!
                                                .hallbookingSlotList![index]
                                                .slotId!
                                                .toString())
                                        ? Colors.blue
                                        : Colors.green,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.36,
                                      child: Center(
                                        child: Row(
                                          children: [
                                            SizedBox(width: 10),
                                            Text(
                                              hallslotdateselectionmodel!
                                                  .data!
                                                  .hallbookingSlotList![index]
                                                  .slotStartTime!,
                                            ),
                                            Text(' - '),
                                            Text(
                                              hallslotdateselectionmodel!
                                                  .data!
                                                  .hallbookingSlotList![index]
                                                  .slotEndTime!,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    hGap10,
                    Text(
                      'Choose Package',
                      style: TextStyle(fontSize: 18),
                    ),
                    hGap10,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.count(
                        crossAxisCount: 2,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children:
                            hallAddonListData.data?.hallAddonList?.map((addon) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomGridTile(
                                      imagePath: addon.image ?? '',
                                      name: addon.name ?? '',
                                      onTap: () {
                                        print('print id${addon.id}');
                                        setState(() {
                                          if (selectedPackageIds
                                              .contains(addon.id)) {
                                            selectedPackageIds.remove(addon.id);
                                          } else {
                                            selectedPackageIds
                                                .add(addon.id.toString());
                                          }
                                        });
                                      },
                                      selected:
                                          selectedPackageIds.contains(addon.id),
                                    ),
                                  );
                                }).toList() ??
                                [],
                      ),
                    ),
                    hGap20,
                    CustomElevatedButton(
                        onPressed: () {
                          Get.to(() => SelectedEventPage(
                              selectedDate: selectedDate,
                              selectedPackageId: selectedPackageIds,
                              SeletedslotId: selectedSlots));
                        },
                        buttonText: 'Add Event'),
                  ],
                ),
              ),
            ));
          } else {
            return Text('No data available');
          }
        },
      ),
    );
  }
}

class CustomGridTile extends StatefulWidget {
  final String imagePath;
  final String name;
  final Function onTap;
  final bool selected;

  const CustomGridTile({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.onTap,
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
          widget.onTap();
        });
      },
      child: Card(
        elevation: 0,
        margin: EdgeInsets.all(8.0),
        color: widget.selected ? Colors.red : Colors.white,
        child: GridTile(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.imagePath),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
              Text(widget.name, style: hb3),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SlotCard extends StatefulWidget {
  final int slotId;
  final bool isSelected;
  final String startTime;
  final String endTime;
  final Function(int) onSlotSelected;

  const SlotCard({
    Key? key,
    required this.slotId,
    required this.isSelected,
    required this.startTime,
    required this.endTime,
    required this.onSlotSelected,
  }) : super(key: key);

  @override
  _SlotCardState createState() => _SlotCardState();
}

class _SlotCardState extends State<SlotCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSlotSelected(widget.slotId);
        setState(() {});
      },
      child: Card(
        color: widget.isSelected ? Colors.blue : Colors.greenAccent,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.36,
          child: Center(
            child: Row(
              children: [
                SizedBox(width: 10),
                Text(widget.startTime),
                Text(' - '),
                Text(widget.endTime),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
