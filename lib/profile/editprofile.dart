import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sreeselvavinayagartemple/Annadhanam/annathanam_date_selection.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';

class EditProfilePage extends StatefulWidget {
  final String name;
  final String email;
  final String phoneNumber;
  const EditProfilePage(
      {super.key,
      required this.name,
      required this.email,
      required this.phoneNumber});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  File? _image;
  @override
  @override
  void initState() {
    // Initialize the controllers with your current profile information
    nameController.text = 'MahamariAmman';
    dobController.text = '31-05-98';
    genderController.text = 'Male';
    emailController.text = 'mahamariaaman@gamil.com';
    phoneNumberController.text = '+60-87766544';
    super.initState();
  }

  // Future<void> _pickImage(ImageSource source) async {
  //   final pickedFile = await ImagePicker().getImage(source: source);

  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //     });
  //   }
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFEFC4),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 40),
                Center(
                    child: GestureDetector(
                  // onTap: () => _pickImage(ImageSource.gallery),
                  child: CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: _image == null
                          ? Image.asset(
                              'assets/sivan.png',
                              fit: BoxFit.fill,
                              width: 150,
                              height: 170,
                            )
                          : Image.file(
                              _image!,
                              fit: BoxFit.fill,
                              width: 150,
                              height: 170,
                            ),
                    ),
                  ),
                )),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      buildEditableField(Icons.person, 'Name', nameController),
                      // buildEditableField(
                      //     Icons.calendar_month, 'Date of Birth', dobController),
                      // ListTile(
                      //   tileColor: Colors.black,
                      //   leading: Icon(
                      //     Icons.person_2_outlined,
                      //     color: Colors.black,
                      //   ),
                      //   title: Text(
                      //     'Gender',
                      //     style: TextStyle(color: Colors.black),
                      //   ),
                      //   subtitle: DropdownButtonFormField<String>(
                      //     iconEnabledColor: Colors.black,
                      //     dropdownColor: Colors.white,
                      //     style: TextStyle(color: Colors.black),
                      //     value: genderController.text,
                      //     onChanged: (String? value) {
                      //       genderController.text = value ?? '';
                      //     },
                      //     items: ['Male', 'Female']
                      //         .map<DropdownMenuItem<String>>((String value) {
                      //       return DropdownMenuItem<String>(
                      //         value: value,
                      //         child: Text(value),
                      //       );
                      //     }).toList(),
                      //     decoration: InputDecoration(
                      //       hintText: 'Select Gender',
                      //     ),
                      //   ),
                      // ),
                      buildEditableField(Icons.email, 'Email', emailController),
                      ListTile(
                        leading: Icon(
                          Icons.mobile_friendly,
                          color: Colors.black,
                        ),
                        title: Text(
                          'Phone Number',
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: TextFormField(
                          style: TextStyle(color: Colors.black),
                          cursorColor: Color.fromARGB(255, 83, 43, 43),
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                            hintText: 'Enter Phone Number',
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp('[^0-9+]')),
                            TextInputFormatter.withFunction(
                                (oldValue, newValue) {
                              if (newValue.text.isEmpty) {
                                return newValue.copyWith(text: '+61');
                              } else if (!newValue.text.startsWith('+')) {
                                return newValue.copyWith(
                                    text: '+61${newValue.text}');
                              }
                              return newValue;
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                hGap30,
                SizedBox(
                    width: 100,
                    child: CustomElevatedButton(
                        onPressed: () {
                          showProfileUpdatedDialog(context);
                        },
                        buttonText: 'Update'))
              ],
            ),
          ),
        ));
  }

  Widget buildEditableField(
      IconData icon, String label, TextEditingController controller) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        label,
        style: TextStyle(color: Colors.black),
      ),
      subtitle: TextFormField(
        style: TextStyle(color: Colors.black),
        cursorColor: Color.fromARGB(255, 83, 43, 43),
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Enter $label',
          hintStyle: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  void showProfileUpdatedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Column(
            children: [
              Text(
                'Profile Updated',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Your profile has been successfully updated.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          // content: Text(
          //   'Your profile has been successfully updated.',
          //   style: TextStyle(color: Colors.black),
          // ),
        );
      },
    );

    // Close the dialog after 3 seconds
    Timer(Duration(seconds: 80), () {
      Navigator.of(context).pop(); // Close the dialog
    });
  }
}
