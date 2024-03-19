import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sreeselvavinayagartemple/aa_controller/session_Controller.dart';
import 'package:sreeselvavinayagartemple/aa_model/userprofile.dart';
import 'package:http/http.dart' as http;
import 'package:sreeselvavinayagartemple/homeScreen/homepage.dart';
import 'package:sreeselvavinayagartemple/profile/profilecheckPage.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';
import 'package:sreeselvavinayagartemple/widgets/customtextform.dart';

class MemberProfileView extends StatefulWidget {
  const MemberProfileView({Key? key}) : super(key: key);

  @override
  State<MemberProfileView> createState() => _MemberProfileViewState();
}

class _MemberProfileViewState extends State<MemberProfileView> {
  //late Future<Userprofile> userprofilemodel = Future.value(Userprofile());
  SessionController? controller;
  bool isEditing = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  Future<void> updateProfile(String name, String username, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('loginId');

    if (userId != null) {
      var body = {
        "user_id": userId.toString(),
        "name": name,
        // "ic_number":phoneNumber,
        "username": username,
        "email": email,
      };

      try {
        final response = await http.post(
          Uri.parse(
              'https://rajamariammanapi.grasp.com.my/public/update_profile'),
          body: body,
        );

        if (response.statusCode == 200) {
          print('Profile updated successfully');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile updated successfully'),
            ),
          );
          Get.to(() => MemberProfileView());
        } else {
          print('Failed to update profile: ${response.statusCode}');
        }
      } catch (error) {
        print('Error updating profile: $error');
      }
    } else {
      print('User not logged in');
    }
  }

  Future<Userprofile> loadMember() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('loginId');
    var body = {"user_id": userId.toString()};
    print('checking body:${body}');
    final response = await http.post(
        Uri.parse('https://rajamariammanapi.grasp.com.my/public/view_profile'),
        body: body);
    if (response.statusCode == 200) {
      print('222222222${response.body}');
      print(response.body);
      return Userprofile.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Failed to load data');
    }
  }

  Future deleteAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? loginId = prefs.getInt('loginId');
    final apiUrl =
        'https://rajamariammanapi.grasp.com.my/public/account_delete';
    final requestBody = {'user_id': '${loginId}'};
    print('check id${loginId}');
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: (requestBody),
      );

      if (response.statusCode == 200) {
        print('Account deleted successfully');
      } else {
        print('${response.statusCode}, ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((prefs) {
      int? loginId = prefs.getInt('loginId');
      if (loginId != null) {
        setState(() {
          loadMember().then((value) {
            loadData(value);
          });
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileNavigationCheck()),
        );
      }
    });
  }

  loadData(Userprofile value) {
    nameController.text = value.data?.profileDetails?.name.toString() ?? '';
    usernameController.text =
        value.data?.profileDetails?.username.toString() ?? '';
    emailcontroller.text = value.data?.profileDetails?.email.toString() ?? '';
  }

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: WillPopScope(
          onWillPop: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
               backgroundColor: const Color(0xFF006CA7),
              title: const Text('Profile Page'),
              actions: [
                // IconButton(
                //     onPressed: () async {
                //       final SharedPreferences prefs =
                //           await SharedPreferences.getInstance();
                //       prefs
                //           .remove("currentUser")
                //           .whenComplete(() => Get.offAll(Homepage()));
                //     },
                //     icon: Icon(Icons.logout)),
                IconButton(
                  icon: Icon(isEditing ? Icons.save : Icons.edit),
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                    });

                    if (!isEditing) ;
                  },
                ),
              ],
            ),
            body: FutureBuilder<Userprofile>(
              future: loadMember(),
              builder:
                  (BuildContext context, AsyncSnapshot<Userprofile> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const SizedBox();
                } else if (snapshot.hasData) {
                  Userprofile userprofile = snapshot.data!;

                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 201, 234, 251),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (!isEditing)
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Container(
                                        height: 120,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/gana.png"),
                                                fit: BoxFit.cover)),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          foregroundImage:
                                              AssetImage("assets/gana.png"),
                                        ),
                                      ),
                                    ),
                                    hGap20,
                                    ListTile(
                                      title: Text('Name'),
                                      subtitle: Container(
                                        padding: EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          readOnly: true,
                                          initialValue: userprofile
                                                  .data?.profileDetails?.name ??
                                              '',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: const Color.fromARGB(
                                                255, 84, 82, 82),
                                          ),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text('User Name'),
                                      subtitle: Container(
                                        padding: EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          readOnly: true,
                                          initialValue: userprofile.data
                                                  ?.profileDetails?.username ??
                                              '',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: const Color.fromARGB(
                                                255, 84, 82, 82),
                                          ),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text('Email'),
                                      subtitle: Container(
                                        padding: EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          readOnly: true,
                                          initialValue: userprofile.data
                                                  ?.profileDetails?.email ??
                                              '',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: const Color.fromARGB(
                                                255, 84, 82, 82),
                                          ),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    hGap10,
                                    Center(
                                      child: CustomElevatedButton(
                                        child: Text('Logout'),
                                        onPressed: () async {
                                          final SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();

                                          prefs.clear().whenComplete(() {
                                            Get.offAll(() => Homepage());
                                          });
                                        },
                                      ),
                                    ),

                                    hGap20,
                                    Center(
                                        child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Delete Account',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color:  Color(0xFF006CA7),),
                                            ))),
                                   
                                  ],
                                ),
                              ),
                            if (isEditing)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/gana.png"),
                                              fit: BoxFit.cover)),
                                      // child: Image.asset(
                                      //       'assets/sivan.png',
                                      //       fit: BoxFit.fill,
                                      //     ), ,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        foregroundImage:
                                            AssetImage("assets/gana.png"),
                                      ),
                                    ),
                                  ),
                                  hGap20,

                                  CustomTextFormFeilds(
                                      controller: nameController,
                                      labelText: 'Name'),
                                  hGap20,
                                  CustomTextFormFeilds(
                                      controller: usernameController,
                                      labelText: 'User Name'),
                                  hGap20,
                                  CustomTextFormFeilds(
                                      controller: emailcontroller,
                                      labelText: 'Email'),
                                  hGap40,
                              
                                  Center(
                                    child: CustomElevatedButton(
                                      child: Text('Update'),
                                      onPressed: () async {
                                        String newName = nameController.text;
                                        String username =
                                            usernameController.text;
                                        String newEmail = emailcontroller.text;
                                        await updateProfile(
                                            newName, username, newEmail);
                                      },
                                    ),
                                  )
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          )),
    );
  }
}
