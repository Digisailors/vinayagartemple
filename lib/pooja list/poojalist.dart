import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
      backgroundColor: Color(0xFFFFEFC4),
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
            child: Text('Pooja List'.tr),
          ),
          actions: [
            PopupMenuButton<int>(
              icon: const Icon(Icons.language,
                  color: Color.fromARGB(255, 69, 67, 67)),
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
                child: Container(
                  width: MediaQuery.of(context).size.width*1,
                  height: MediaQuery.of(context).size.height*0.25,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/ps1.jpeg',
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
              // CarouselSlider.builder(
              //   options: CarouselOptions(
              //     height: MediaQuery.of(context).size.height * 0.26,
              //     aspectRatio: 16 / 2,
              //     viewportFraction: 0.8,
              //     initialPage: 0,
              //     enableInfiniteScroll: true,
              //     reverse: true,
              //     autoPlay: true,
              //     autoPlayInterval: const Duration(seconds: 2),
              //     autoPlayAnimationDuration: const Duration(milliseconds: 800),
              //     autoPlayCurve: Curves.fastOutSlowIn,
              //     enlargeCenterPage: true,
              //     enlargeFactor: 0.3,
              //     scrollDirection: Axis.horizontal,
              //     onPageChanged: (index, reason) {},
              //   ),
              //   itemCount: imagePaths.length,
              //   itemBuilder: (BuildContext context, int index, int realIndex) {
              //     return Builder(
              //       builder: (BuildContext context) {
              //         return ClipRRect(
              //           borderRadius: BorderRadius.circular(16.0),
              //           child: Container(
              //             width: MediaQuery.of(context).size.width * 1,
              //             margin: const EdgeInsets.symmetric(horizontal: 5.0),
              //             decoration: BoxDecoration(
              //               image: DecorationImage(
              //                 image: AssetImage(imagePaths[index]),
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //           ),
              //         );
              //       },
              //     );
              //   },
              // ),
              CustomPojaCard(
                title: 'Pournami Pooja'.tr,
                imagePath: 'assets/poojatiming1.png',
                child: const AutoSizeText(
                  'View Details',
                  style: h3,
                ),
                onPressed: () {
                  Get.to(() => const PournamiPooja());
                },
              ),
              CustomPojaCard(
                  title: 'Ammavasai Pooja'.tr,
                  imagePath: 'assets/poojatiming2.png',
                  child: const AutoSizeText(
                    'View Details',
                    style: h3,
                  ),
                  onPressed: () {
                    Get.to(() => const AmmavasaiPage());
                  }),
              CustomPojaCard(
                  title: 'Theipirai Astami Bairavar Pooja'.tr,
                  imagePath: 'assets/poojatiming3.png',
                  child: const AutoSizeText(
                    'View Details',
                    style: h3,
                  ),
                  onPressed: () {
                    Get.to(() => const Bairawarpoja());
                  }),
              CustomPojaCard(
                  title: 'Pradosha Pooja'.tr,
                  imagePath: 'assets/poojatiming4.png',
                  child: const AutoSizeText(
                    'View Details',
                    style: h3,
                  ),
                  onPressed: () {
                    Get.to(() => const PradoshaPoojaPage());
                  }),
              CustomPojaCard(
                  title: 'Rahukala Pooja'.tr,
                  imagePath: 'assets/poojatiming5.png',
                  child: const AutoSizeText(
                    'View Details',
                    style: h3,
                  ),
                  onPressed: () {
                    Get.to(() => const RaguKalaPage());
                  }),
              CustomPojaCard(
                  title: 'Gho Pooja'.tr,
                  imagePath: 'assets/poojatiming1.png',
                  child: const AutoSizeText(
                    'View Details',
                    style: h3,
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
                            const Color(0xFFFF0000)), // Red color
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
