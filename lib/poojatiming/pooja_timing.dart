import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';

class Poojatimeing extends StatefulWidget {
  const Poojatimeing({super.key});

  @override
  State<Poojatimeing> createState() => _PoojatimeingState();
}

class _PoojatimeingState extends State<Poojatimeing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE4F5FF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 20),
        child: AppBar(
          backgroundColor: Color(0xFF006CA7),
          title: Text('Pooja Time'),
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
     
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      hGap10,
                      Text(
                        'NOTES'.tr,
                        style: hr4,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.brightness_1,
                          color: Colors.red,
                        ),
                        title: Text(
                          'On Friday and special Function days Evening Pooja Will be conducted at 6.30pm or as otherwise specified by management'
                              .tr,
                          style: hb14,
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.brightness_1,
                          color: Colors.red,
                        ),
                        title: Text(
                          'On Tuesdays Temple door opens at 3.30pm for Raagu kala Pooja'
                              .tr,
                          style: hb14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomCardWidget(
                title: 'Temple Opens'.tr,
                time: '06:00 ',
                times: 'am'.tr,
                imagePath: 'assets/sv3.jpg',
              ),
              CustomCardWidget(
                  title: 'Padithara Abhishegam'.tr,
                  time: '06:30 ',
                  times: 'pm'.tr,
                  imagePath: 'assets/sv1.jpg'),
              CustomCardWidget(
                  title: 'Morning Pooja'.tr,
                  time: '07:00',
                  times: ' am'.tr,
                  imagePath: 'assets/sv2.jpg'),
              CustomCardWidget(
                  title: 'Noon Pooja'.tr,
                  time: '12:00 '.tr,
                  times: 'pm'.tr,
                  imagePath: 'assets/sv3.jpg'),
              CustomCardWidget(
                  title: 'Evening Temple Opening'.tr,
                  time: '06:00 ',
                  times: 'pm'.tr,
                  imagePath: 'assets/sv3.jpg'),
              CustomCardWidget(
                  title: 'Padithara Abhishegam'.tr,
                  time: '06:00',
                  times: 'pm'.tr,
                  imagePath: 'assets/sv3.jpg'),
              CustomCardWidget(
                  title: 'Evening Pooja'.tr,
                  time: '07:00 ',
                  times: 'pm'.tr,
                  imagePath: 'assets/sv3.jpg'),
              CustomCardWidget(
                  title: 'Arthasama Pooja'.tr,
                  time: '09:00 '.tr,
                  times: 'pm'.tr,
                  imagePath: 'assets/sv2.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCardWidget extends StatelessWidget {
  final String title;
  final String time;
  final String times;
  final String imagePath;

  CustomCardWidget(
      {required this.title,
      required this.time,
      required this.imagePath,
      required this.times});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.09,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 2,
                offset: Offset(0, 2),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(time,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                    SizedBox(width: 8),
                    Text(times,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                    SizedBox(width: 8),
                    Image.asset(
                      imagePath,
                      width: 70,
                      height: 70,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
