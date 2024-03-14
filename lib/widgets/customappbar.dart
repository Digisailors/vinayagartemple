import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../themes/font_height.dart';
class CustomAppbar extends StatefulWidget {
  final String titletext;
  const CustomAppbar({Key? key, required this.titletext}) : super(key: key);
  

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 20),
          child: AppBar(
            backgroundColor: Color(0xFF006CA7),
            title: Text(
              widget.titletext, // Use widget.titletext to access the title text
              style: TextStyle(
                // You can apply custom styles to the title text here
              ),
            ),
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
                      ),
                    ),
                  ),
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
                      ),
                    ),
                  ),
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
                  bottomRight: Radius.circular(22),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
