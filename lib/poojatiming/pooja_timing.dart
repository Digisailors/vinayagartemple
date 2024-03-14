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
      backgroundColor: Color(0xFFFFEFC4),
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
            child: Text('Pooja Time'.tr),
          ),
          actions: [
            PopupMenuButton<int>(
              icon:
                  Icon(Icons.language, color: Color.fromARGB(255, 69, 67, 67)),
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
          ]),
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
                imagePath: 'assets/poojatiming1.png',
              ),
              CustomCardWidget(
                  title: 'Padithara Abhishegam'.tr,
                  time: '06:30 ',
                  times: 'pm'.tr,
                  imagePath: 'assets/poojatiming2.png'),
              CustomCardWidget(
                  title: 'Morning Pooja'.tr,
                  time: '07:00',
                  times: ' am'.tr,
                  imagePath: 'assets/poojatiming3.png'),
              CustomCardWidget(
                  title: 'Noon Pooja'.tr,
                  time: '12:00 '.tr,
                  times: 'pm'.tr,
                  imagePath: 'assets/poojatiming4.png'),
              CustomCardWidget(
                  title: 'Evening Temple Opening'.tr,
                  time: '06:00 ',
                  times: 'pm'.tr,
                  imagePath: 'assets/poojatiming5.png'),
              CustomCardWidget(
                  title: 'Padithara Abhishegam'.tr,
                  time: '06:00',
                  times: 'pm'.tr,
                  imagePath: 'assets/poojatiming1.png'),
              CustomCardWidget(
                  title: 'Evening Pooja'.tr,
                  time: '07:00 ',
                  times: 'pm'.tr,
                  imagePath: 'assets/poojatiming2.png'), 
              CustomCardWidget(
                  title: 'Arthasama Pooja'.tr,
                  time: '09:00 '.tr,
                  times: 'pm'.tr,
                  imagePath: 'assets/poojatiming3.png'),
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
