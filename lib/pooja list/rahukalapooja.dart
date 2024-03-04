import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';

class RaguKalaPage extends StatefulWidget {
  const RaguKalaPage({Key? key}) : super(key: key);

  @override
  State<RaguKalaPage> createState() => RaguKalaPageState();
}

class RaguKalaPageState extends State<RaguKalaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFFFEFC4),
      appBar: AppBar(
        title: Text('RAHU KALA POOJA'.tr,style: h2,),
        backgroundColor:Colors.red,
        actions: [ PopupMenuButton<int>(
                icon: Icon(Icons.language, color: Color.fromARGB(255, 69, 67, 67)),
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
              )]
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
                  Card(
                  elevation: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width*1,
                    height: MediaQuery.of(context).size.height*0.25,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/rahupooja.jpg',
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
                hGap10,
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Rahu kaala poojai'.tr,
                      style: hr4,
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width:MediaQuery.of(context).size.width*1,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      'Every Tuesday,the Devasthanam perfroms Rahu kala durga pooja from 4.00pm onwards. this will commence with special Abhisegam for Goddess Durga followed by pooja and Arathi. All devotees are urged to attend this prayer'.tr,
                      style: TextStyle(
                        fontSize: 16,fontFamily: 'Inter', color: Color(0xFF391E72),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                hGap15,
            ],
          ),
        ),
      ),
    );
  }
}