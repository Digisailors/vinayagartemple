import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sreeselvavinayagartemple/Launchpages/launchnewpage.dart';


import 'package:sreeselvavinayagartemple/aa_controller/session_Controller.dart';
import 'package:sreeselvavinayagartemple/homeScreen/homepage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  SessionController? controller;
  bool? checkUser;
  @override
  void initState() {
    checkCurrentUser();
    checkFirstTimeLaunch();
    super.initState();
  }

  checkFirstTimeLaunch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool("firstTimeLaunch") ?? true;

    if (isFirstTime) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LaunchNewPage()),
      );

      prefs.setBool("firstTimeLaunch", false);
    } else {
      checkCurrentUser();
    }
  }

  checkCurrentUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString("currentUser") == null ||
        prefs.getString("currentUser") == "") {
      setState(() {
        checkUser = false;
      });
    } else {
      setState(() {
        checkUser = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (checkUser == false) {
      return  Homepage();
    } else if (checkUser == true) {
      return Homepage();
    }
    return Container(
      color: Colors.white,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
