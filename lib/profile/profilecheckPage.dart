import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreeselvavinayagartemple/Authentication/Signup%20page/signupnew.dart';
import 'package:sreeselvavinayagartemple/homeScreen/homepage.dart';

class ProfileNavigationCheck extends StatefulWidget {
  const ProfileNavigationCheck({super.key});

  @override
  State<ProfileNavigationCheck> createState() => _ProfileNavigationCheckState();
}

class _ProfileNavigationCheckState extends State<ProfileNavigationCheck> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('SignUp?'),
      content: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Get.to(()=>SignUp());
            }, child:Text('Yes')),
                ElevatedButton(onPressed: (){
                  Get.to(()=>Homepage());
                }, child:Text('No')),
          ],
        ),
      ),
    );

  }
}