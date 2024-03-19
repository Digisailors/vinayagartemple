import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sreeselvavinayagartemple/Authentication/Login%20page/login.dart';
import 'package:sreeselvavinayagartemple/aa_controller/session_Controller.dart';
import 'package:sreeselvavinayagartemple/aa_model/userprofile.dart';
import 'package:sreeselvavinayagartemple/profile/editprofile.dart';
import 'package:http/http.dart' as http;
import 'package:sreeselvavinayagartemple/themes/color_schemes.g.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<Userprofile> userprofilemodel;
  SessionController? controller;
  Future<Userprofile> loadMember() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? loginId = prefs.getInt('loginId');
    var body = {"user_id": "33"};
    print(body);
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
    int? loginId = prefs.getInt('33');
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
    controller = Get.put(SessionController());
    print("loginId${controller!.loginId}");
    userprofilemodel = loadMember();
  }
 final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
      
      backgroundColor:  Color(0xFFFFEFC4),
      
        appBar: AppBar(
          centerTitle: true,
           backgroundColor: const Color(0xFF006CA7),
          elevation: 0,
          title: const Text('Profile'),
        ),
        body: FutureBuilder<Userprofile>(
          future: userprofilemodel,
          builder: (BuildContext context, AsyncSnapshot<Userprofile> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              return Container(
                width: double.infinity,
                height: double.infinity, 
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 239, 196),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // SizedBox(
                        //     height: MediaQuery.of(context).size.height * 0.18),
                        hGap10,
                        Center(
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/gana.png"),
                                    fit: BoxFit.cover)),
                            // child: Image.asset(
                            //       'assets/sivan.png',
                            //       fit: BoxFit.fill,
                            //     ), ,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              foregroundImage: AssetImage("assets/gana.png"),
                            ),
                          ),
                          // child: CircleAvatar(
                          //   radius: 65,
                          //   backgroundColor: const Color.fromARGB(66, 71, 70, 70),
                          //   child: ClipOval(
                          //     child: Image.asset(
                          //       'assets/sivan.png',
                          //       fit: BoxFit.fill,
                          //     ),
                          //   ),
                          // ),
                        ),
                        hGap10,
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: SizedBox(
                            //height: MediaQuery.of(context).size.height * 0.33,
                            width: MediaQuery.of(context).size.width > 300
                                ? 400
                                : 200,
                            child: Column(
                              children: [
                                Card(
                                  elevation: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                    ),
                                    child: ListTile(
                                      leading: const Icon(
                                        Icons.person_2_outlined,
                                        color: Colors.black,
                                      ),
                                      title: AutoSizeText(
                                        snapshot.data!.data!.profileDetails!
                                                .name ??
                                            '',
                                        minFontSize: 14,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        maxFontSize: 20,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      // subtitle: AutoSizeText(
                                      //   snapshot.data!.data!.profileDetails!.name ??
                                      //       '',
                                      //   minFontSize: 14,
                                      //   maxLines: 1,
                                      //   overflow: TextOverflow.ellipsis,
                                      //   maxFontSize: 20,
                                      // ),
                                    ),
                                  ),
                                ),
                                hGap10,
                                Card(
                                  elevation: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                    ),
                                    child: ListTile(
                                      leading: const Icon(
                                        Icons.email_outlined,
                                        color: Colors.black,
                                      ),
                                      title: AutoSizeText(
                                        snapshot.data!.data!.profileDetails!
                                                .email ??
                                            '',
                                        minFontSize: 14,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        maxFontSize: 20,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      // subtitle: AutoSizeText(
                                      //   snapshot.data!.data!.profileDetails!
                                      //           .username ??
                                      //       '',
                                      //   minFontSize: 14,
                                      //   maxLines: 1,
                                      //   overflow: TextOverflow.ellipsis,
                                      //   maxFontSize: 20,
                                      // ),
                                    ),
                                  ),
                                ),
                                hGap10,
      
                                Card(
                                  elevation: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                    ),
                                    child: ListTile(
                                      leading: const Icon(
                                        Icons.phone_outlined,
                                        color: Colors.black,
                                      ),
                                      title: AutoSizeText(
                                        snapshot.data!.data!.profileDetails!
                                                .icNumber ??
                                            '',
                                        minFontSize: 14,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        maxFontSize: 20,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                   
                                    ),
                                  ),
                                ),
                                hGap10,
                                
      
                             
                                hGap10,
      
                          
                              ],
                            ),
                          ),
                        ),
                        hGap40,
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => EditProfilePage(
                                    name: snapshot
                                            .data!.data!.profileDetails!.name ??
                                        '',
                                    phoneNumber: snapshot
                                            .data!.data!.profileDetails!.name ??
                                        '',
                                    email: '',
                                  ));
                            },
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                backgroundColor: lightColorScheme.primary),
                          ),
                        ),
                        hGap40,
                        SizedBox(
                          width: 300,
                          child: Card(
                            child: ListTile(
                              trailing: const Icon(
                                Icons.arrow_right_outlined,
                                size: 30,
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    actions: [
                                      TextButton(
                                          onPressed: () async {
                                            Navigator.of(context).pop();
                                            deleteAccount();
                                            await Get.offAll(const LoginPage());
                                         
                                          },
                                          child: const Text(
                                            'Yes',
                                            style: TextStyle(color: Colors.red),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                          },
                                          child: const Text(
                                            'No',
                                            style: TextStyle(color: Colors.red),
                                          ))
                                    ],
                                    title: const Text('Delete Account'),
                                    content: const Text(
                                        'Are you sure Delete your account?'),
                                  ),
                                );
                              },
                              leading: const Icon(
                                Icons.error_outline,
                                color: Colors.red,
                              ),
                              title: const Text(
                                  'If you want to delete your Account'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
