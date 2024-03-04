// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sreeselvavinayagartemple/Annadhanam/annathanam_date_selection.dart';
// import 'package:sreeselvavinayagartemple/Price%20List/pricelist.dart';
// import 'package:sreeselvavinayagartemple/contacts.dart';
// import 'package:sreeselvavinayagartemple/festivals/festivalcalender.dart';
// import 'package:sreeselvavinayagartemple/pooja%20list/poojalist.dart';
// import 'package:sreeselvavinayagartemple/poojatiming/pooja_timing.dart';
// import 'package:sreeselvavinayagartemple/themes/font_height.dart';

// List<String> imageList = [
//   'assets/slider1.jpg',
//   'assets/slider2.jpg',
//   'assets/slider3.jpg',
//   'assets/slider4.jpg',
//   'assets/slider5.jpg',
//   'assets/slider6.jpg',
// ];

// class HomeMenuScreen extends StatefulWidget {
//   const HomeMenuScreen({super.key});

//   @override
//   State<HomeMenuScreen> createState() => _HomeMenuScreenState();
// }

// class _HomeMenuScreenState extends State<HomeMenuScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(80.0),
//         child: AppBar(
//             backgroundColor: Colors.white,
//             leading: SizedBox(
//                 height: 10, width: 10, child: Image.asset('assets/ammannew.png')),
//             title: const Center(
//                 child: Column(
//               children: [
//                 AutoSizeText(
//                   'ஓம் சக்தி',
//                   style: hr3,
//                 ),
//                 AutoSizeText(
//                   'அருள்மிகு இராஜமாரியம்மன் தேவஸ்தானம்',
//                   style: hr3,
//                 ),
//                AutoSizeText(
//                   'ARULMIGU RAJAMARIAMMAN DEVASTHANAM',
//                   style: hr3,
//                 ),
//                 AutoSizeText(
//                   'JOHOR BAHRU',
//                   style: hr3,
//                 )
//               ],
//             )),
//             actions: [
//               PopupMenuButton<int>(
//                 icon: const Icon(Icons.language,
//                     color: Color.fromARGB(255, 69, 67, 67)),
//                 itemBuilder: (context) => [
//                   PopupMenuItem(
//                       value: 1,
//                       child: TextButton(
//                           onPressed: () {
//                             var locale = const Locale('en', 'US');
//                             Get.updateLocale(locale);
//                           },
//                           child: const AutoSizeText(
//                             'தமிழ்',
//                             style: hb3,
//                           ))),
//                   PopupMenuItem(
//                       value: 2,
//                       child: TextButton(
//                           onPressed: () {
//                             var locale = const Locale('ms', 'MS');
//                             Get.updateLocale(locale);
//                           },
//                           child: const AutoSizeText(
//                             'English',
//                             style: hb3,
//                           ))),
//                 ],
//               ),
//               // IconButton(
//               //     onPressed: () async {
//               //       final SharedPreferences prefs =
//               //           await SharedPreferences.getInstance();
//               //       prefs.remove("currentUser").whenComplete(() =>  Get.offAll(const LandingPage()));
//               //     },
//               //     icon: const Icon(
//               //       Icons.logout,
//               //       color: Colors.black,
//               //     ))
//             ]),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             hGap10,
//             CarouselSlider.builder(
//               options: CarouselOptions(
//                 height: MediaQuery.of(context).size.height*0.24,
//                 aspectRatio: 16 / 2,
//                 viewportFraction: 0.8,
//                 initialPage: 0,
//                 enableInfiniteScroll: true,
//                 reverse: false,
//                 autoPlay: true,
//                 autoPlayInterval: Duration(seconds: 2),
//                 autoPlayAnimationDuration: Duration(milliseconds: 800),
//                 autoPlayCurve: Curves.fastOutSlowIn,
//                 enlargeCenterPage: true,
//                 enlargeFactor: 0.3,
//                 scrollDirection: Axis.horizontal,
//                 onPageChanged: (index, reason) {},
//               ),
//               itemCount: imageList.length,
//               itemBuilder: (BuildContext context, int index, int realIndex) {
//                 return Builder(
//                   builder: (BuildContext context) {
//                     return Container(
//                       width: MediaQuery.of(context).size.width,
//                       margin: EdgeInsets.symmetric(horizontal: 5.0),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.circular(10.0),
//                         image: DecorationImage(
//                           image: AssetImage(imageList[index]),
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//             GridView.count(
//               scrollDirection: Axis.vertical,
//               shrinkWrap: true,
//               crossAxisCount: 3,
//               children: [
//                 CustomGridTile(
//                     imagePath: 'assets/poojatiming4.png',
//                     name: 'TimingPooja  '.tr,
//                     onTap: () {
//                       Get.to(() => Poojatimeing());
//                     }),
//                 CustomGridTile(
//                     imagePath: 'assets/festival.png',
//                      name: 'Festival'.tr,
//                     onTap: () {
//                       Get.to(() => FestivalPage());
//                     }),
//                 CustomGridTile(
//                     imagePath: 'assets/poojatiming2.png',
//                     name: 'Pooja Price'.tr,
//                     onTap: () {
//                       Get.to(() => PriceList());
//                     }),
//                 CustomGridTile(
//                     imagePath: 'assets/annathanam.png',
//                     name: 'Anathanam'.tr,
//                     onTap: () {
//                       Get.to(() => AnnathanamDateSelection());
//                     }),
//                    CustomGridTile(
//                     imagePath: 'assets/pooja1.png',
//                     name: 'Pooja List'.tr,
//                     onTap: () {
//                       Get.to(() => PoojaList());
//                     }),
              
//                     CustomGridTile(
//                     imagePath: 'assets/contactus.png',
//                     name: 'Contact Us'.tr,
//                     onTap: () {
//                       Get.to(()=> ContactsPage());
//                     }),
               
//               ],
//             ),
//             hGap30
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget buildDot({required int index, required BuildContext context}) {
//   return Container(
//     margin: EdgeInsets.symmetric(horizontal: 2.0),
//     width: MediaQuery.of(context).size.width * 0.6,
//     height: MediaQuery.of(context).size.height*0.6,
//     decoration: BoxDecoration(
//       shape: BoxShape.circle,
//       color: index == 0 ? Colors.blue : Colors.grey,
//     ),
//   );
// }

// class CustomGridTile extends StatelessWidget {
//   final String imagePath;
//   final String name;
//   final Function onTap;

//   const CustomGridTile({
//     Key? key,
//     required this.imagePath,
//     required this.name,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         onTap();
//       },
//       child: Card(
//         elevation: 0,
//         margin: EdgeInsets.all(8.0),
//         child: GridTile(
//           child: Column(
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.6,
//                     width: MediaQuery.of(context).size.width * 0.6,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(imagePath),
//                           fit: BoxFit.fill,
//                         ),
//                         borderRadius: BorderRadius.circular(8),
                      
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//              AutoSizeText(name, style: hb3),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
