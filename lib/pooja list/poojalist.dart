import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreeselvavinayagartemple/pooja%20list/ammavasai.dart';
import 'package:sreeselvavinayagartemple/pooja%20list/bairawarpoja.dart';
import 'package:sreeselvavinayagartemple/pooja%20list/goapooja.dart';
import 'package:sreeselvavinayagartemple/pooja%20list/pournami.dart';
import 'package:sreeselvavinayagartemple/pooja%20list/pradoshapooja.dart';
import 'package:sreeselvavinayagartemple/pooja%20list/rahukalapooja.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';


class PoojaList extends StatefulWidget {
  const PoojaList({super.key});

  @override
  State<PoojaList> createState() => _PoojaListState();
}

class _PoojaListState extends State<PoojaList> {
  final List<String> imagePaths = [
    'assets/poojatiming2.png',
    'assets/ps1.jpeg',
    'assets/poojatiming1.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFFE4F5FF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 4),
        child: AppBar(
          backgroundColor: Color(0xFF006CA7),
          title: Text('Pooja List'),
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
                child: Container(
                  width: MediaQuery.of(context).size.width*1,
                  height: MediaQuery.of(context).size.height*0.25,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/sv15.jpg',
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
          
              CustomPojaCard(
                title: 'Pournami Pooja'.tr,
                imagePath: 'assets/sv16.jpg',
                child: const Text(
                  'View Details',
                  style: hbl3,
                ),
                onPressed: () {
                  Get.to(() => const PournamiPooja());
                },
              ),
              CustomPojaCard(
                  title: 'Ammavasai Pooja'.tr,
                  imagePath: 'assets/sv17.jpg',
                  child: const Text(
                    'View Details',
                    style:hbl3,
                  ),
                  onPressed: () {
                    Get.to(() => const AmmavasaiPage());
                  }),
              CustomPojaCard(
                  title: 'Theipirai Astami Bairavar Pooja'.tr,
                  imagePath: 'assets/sv18.jpg',
                  child: const AutoSizeText(
                    'View Details',
                    style: hbl3,
                  ),
                  onPressed: () {
                    Get.to(() => const Bairawarpoja());
                  }),
              CustomPojaCard(
                  title: 'Pradosha Pooja19'.tr,
                  imagePath: 'assets/sv19.jpg',
                  child: const AutoSizeText(
                    'View Details',
                    style: hbl3,
                  ),
                  onPressed: () {
                    Get.to(() => const PradoshaPoojaPage());
                  }),
              CustomPojaCard(
                  title: 'Rahukala Pooja20'.tr,
                  imagePath: 'assets/sv20.jpg',
                  child: const AutoSizeText(
                    'View Details',
                    style: hbl3,
                  ),
                  onPressed: () {
                    Get.to(() => const RaguKalaPage());
                  }),
              CustomPojaCard(
                  title: 'Gho Pooja'.tr,
                  imagePath: 'assets/sv21.jpg',
                  child: const AutoSizeText(
                    'View Details',
                    style:hbl3,
                  ),
                  onPressed: () {
                    Get.to(() => const Gohpooja());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
const TextStyle hbl3 =
    TextStyle(fontSize: 12, color:Color(0xFF006CA7),   fontFamily: 'Poppins', fontWeight: FontWeight.w400,);
class CustomPojaCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onPressed;
  final Widget? child;

  CustomPojaCard(
      {required this.title,
      required this.imagePath,
      this.child,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              const BoxShadow(
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipOval(
                  child: Image.asset(
                    imagePath,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [],
                ),
                SizedBox(
                  width: 150,
                  child: AutoSizeText(
                    title,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                    height: 30,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: onPressed,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFFE4F5FF),),
                        elevation: MaterialStateProperty.all<double>(4),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(41),
                          ),
                        ),
                      ),
                      child: child,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
