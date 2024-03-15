// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreeselvavinayagartemple/Annadhanam/foodmenupage.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AnnathanamDateSelection extends StatefulWidget {
  const AnnathanamDateSelection({super.key});

  @override
  State<AnnathanamDateSelection> createState() =>
      _AnnathanamDateSelectionState();
}

class _AnnathanamDateSelectionState extends State<AnnathanamDateSelection> {
   int selectedMealIndex = 0;
  List<bool> selectedChipIndices = [true, false, false];

  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
  }



 Future _selectDate(BuildContext context) async {
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
    final formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

    setState(() {
      selectedDate = pickedDate;
    });
  }
}

  Future<List<int>?> _fetchDropdownValues(DateTime selectedDate) async {
    const apiUrl =
        'https://rajamariammanapi.grasp.com.my/public/annathanam/annathanam_get_date';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({"date": selectedDate.toIso8601String()}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['success']) {
          List<int> dropdownValues =
              (data['data']['no_of_pax'] as List<dynamic>)
                  .map((value) => int.tryParse(value.toString()) ?? 0)
                  .toList();
          return dropdownValues;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
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
          actions: [
            PopupMenuButton<int>(
              icon: Image.asset('assets/language.png'),
              itemBuilder: (context) => [
                PopupMenuItem(
                    value: 1,
                    child: TextButton(
                        onPressed: () {
                          var locale = const Locale('en', 'US');
                          Get.updateLocale(locale);
                        },
                        child: const Text(
                          'தமிழ்',
                          style: hb3,
                        ))),
                PopupMenuItem(
                    value: 2,
                    child: TextButton(
                        onPressed: () {
                          var locale = const Locale('ms', 'MS');
                          Get.updateLocale(locale);
                        },
                        child: const Text(
                          'English',
                          style: hb3,
                        ))),
              ],
            )
          ],
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Card(
                //color: Color.fromARGB(255, 64, 64, 64),
                elevation: 5,
                child: ListTile(
                  title: AutoSizeText('Note :'),
                  subtitle: AutoSizeText(
                    'Annathaanam Booking Will be Accepted For minimum 100 Person  Only . Devotees Are Encouraged To Sponsor any of the Above Meals Especially on Fridays , Birthday Anniversary or Any Special Occasions',
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              const ListTile(
                leading: AutoSizeText(
                  'Select Date',
                  style: hb2,
                ),
              ),
              CustomTextFormFeild2(
                controller: TextEditingController(
                    text:
                        '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
                labelText: 'Date',
                surffixIcon: Icons.calendar_month,
                hinttext: 'DD/MM/YY',
                onTap: () => _selectDate(context),
              ),
              const ListTile(
                leading: AutoSizeText(
                  'Choose Menu',
                  style: hb2,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 IconTextChoiceChip(
                    icon: Icons.breakfast_dining_sharp,
                    label: 'Breakfast',
                    isSelected: selectedMealIndex == 0,
                    onSelected: (isSelected) {
                      if (isSelected) {
                        setState(() {
                          selectedMealIndex = 0;
                        });
                      }
                    },
                  ),
                  wGap10,
                  IconTextChoiceChip(
                    icon: Icons.lunch_dining_rounded,
                    label: 'Lunch',
                    isSelected: selectedMealIndex == 1,
                    onSelected: (isSelected) {
                      if (isSelected) {
                        setState(() {
                          selectedMealIndex = 1;
                        });
                      }
                    },
                  ),
                  wGap10,
                  IconTextChoiceChip(
                    icon: Icons.dinner_dining_rounded,
                    label: 'Dinner',
                    isSelected: selectedMealIndex == 2,
                    onSelected: (isSelected) {
                      if (isSelected) {
                        setState(() {
                          selectedMealIndex = 2;
                        });
                      }
                    },
                  ),
                ],
              ),
              hGap40,
              hGap40,
              CustomElevatedButton(
                onPressed: () async {
                  List<int>? dropdownValues =
                      await _fetchDropdownValues(selectedDate);

                  if (dropdownValues != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodMenuPage(
                          selectedDate: selectedDate,
                          dropdownValues: dropdownValues,
                           selectedMealIndex: selectedMealIndex,
                        ),
                      ),
                    );
                  } else {}
                },
                buttonText: 'Proceed',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconTextChoiceChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final Function(bool) onSelected;

  const IconTextChoiceChip({super.key, 
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 5),
          Text(label),
        ],
      ),
      selected: isSelected,
      selectedColor: Colors.green,
      backgroundColor: Colors.red,
      onSelected: onSelected,
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const CustomElevatedButton({
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF006CA7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
      ),
      child: SizedBox(
        width: 356,
        height: 50,
        child: Center(
          child: AutoSizeText(
            buttonText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFormFeild2 extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hinttext;

  final IconData? surffixIcon;
  final Future<void> Function() onTap;

  const CustomTextFormFeild2({
    super.key,
    required this.controller,
    required this.labelText,
    this.hinttext,
    this.surffixIcon,
    required this.onTap,
  });

  @override
  _CustomTextFormFeild1State createState() => _CustomTextFormFeild1State();
}

class _CustomTextFormFeild1State extends State<CustomTextFormFeild2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        readOnly: true,
        onTap: () async {
          await widget.onTap();
        },
        controller: widget.controller,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hinttext,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: widget.surffixIcon != null
              ? Icon(widget.surffixIcon, color: Colors.black)
              : null,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '${widget.labelText} is required';
          }
          return null;
        },
      ),
    );
  }
}
