import 'package:flutter/material.dart';
import 'package:sreeselvavinayagartemple/contact.dart';
import 'package:sreeselvavinayagartemple/homeScreen/homenewscreen.dart';
import 'package:sreeselvavinayagartemple/livestreaming_page/youtubepage.dart';
import 'package:sreeselvavinayagartemple/profile/member_profile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import 'secondhome.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> bottomBarWidgets = [
    const HomeScreenNewPage(),
   const MemberProfileView(),
   
   ContactPage(),

  ];
  int currentPageIndex = 0;
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
       body: bottomBarWidgets[currentPageIndex],
       bottomNavigationBar: NavigationBar(
         height: 70,
         surfaceTintColor: Colors.red,
         onDestinationSelected: (int index) {
         
             setState(() {
               currentPageIndex = index;
             });
           
         },
         selectedIndex: currentPageIndex,
         elevation: 10,
         backgroundColor: Colors.red,
         indicatorColor: Color.fromARGB(255, 60, 55, 55).withOpacity(0.5),
         destinations: [
            NavigationDestination(
             selectedIcon: Icon(Icons.home, color: Colors.white),
             icon: Badge(
              isLabelVisible: false,
                 child: SizedBox(
                  height: 30,
                  child: Image.asset('assets/homeicon.png'))),
             label: 'Home',
             
           ),
         
            NavigationDestination(
             icon: Badge(
              isLabelVisible: false,
              textColor: Colors.white,
                 child: SizedBox(
                  height: 30,
                  child: Image.asset('assets/profileicon.png'))),
             label: 'Profile',
            
           ),
              NavigationDestination(
             icon:  Badge(
              isLabelVisible: false,
                 child: SizedBox(
                  height: 30,
                  child: Image.asset('assets/callicon.png'))),
             label: 'Contact',
           ),
         ],
       ),
     );
  }

  void launchYouTubeVideo(String videoId) {
    launch('https://www.youtube.com/watch?v=$videoId');
  }
}
