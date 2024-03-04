import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';
import 'package:sreeselvavinayagartemple/Annadhanam/annathanam_date_selection.dart';
import 'package:sreeselvavinayagartemple/Price%20List/pricelist.dart';
import 'package:sreeselvavinayagartemple/aa_model/videolistmodel.dart';

import 'package:sreeselvavinayagartemple/donation/donationlistnew.dart';
import 'package:sreeselvavinayagartemple/festivals/festivalcalender.dart';
import 'package:sreeselvavinayagartemple/hall_booking/hallDateSectionpage.dart';
import 'package:sreeselvavinayagartemple/homeScreen/homevideoplayer.dart';
import 'package:sreeselvavinayagartemple/homeScreen/newsannouncement.dart';
import 'package:sreeselvavinayagartemple/livestreaming_page/customvideoplayer.dart';
import 'package:sreeselvavinayagartemple/pooja%20list/poojalist.dart';
import 'package:sreeselvavinayagartemple/poojatiming/pooja_timing.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';
import 'package:http/http.dart' as http;
import 'package:sreeselvavinayagartemple/ubayam/ubayamselectionpage.dart';

class HomeScreenNewPage extends StatefulWidget {
  const HomeScreenNewPage({super.key});

  @override
  State<HomeScreenNewPage> createState() => _HomeScreenNewPageState();
}

class _HomeScreenNewPageState extends State<HomeScreenNewPage> {
  Videolistmodel? videolistmodel;
  late final PodPlayerController controller;
  bool isLoading = true;

  List<YoutubeList>? youtubeList;
  static const List<String> sampleImages = [
    'assets/mainslider0.jpg',
    'assets/mainslider1.jpg',
    // 'assets/mainslider2.jpeg',
    //'assets/mainslider3.jpeg',
    // 'assets/mainsliders.jpg',
  ];
  @override
  void initState() {
    super.initState();
    videodata();
    loadVideo();
  }

  Future<void> videodata() async {
    final response = await http.get(
        Uri.parse('https://rajamariammanapi.grasp.com.my/public/youtube/list'));
    if (response.statusCode == 200) {
      print(response.body);
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final Videolistmodel videolistmodel =
          Videolistmodel.fromJson(responseData);
      setState(() {
        youtubeList = videolistmodel.data?.youtubeList;
      });
    } else {
      print('Error');
    }
  }

  void loadVideo() async {
    final urls = await PodPlayerController.getYoutubeUrls(
      'https://www.youtube.com/@arulmigurajamariammandevas7267',
    );
    setState(() => isLoading = false);
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.networkQualityUrls(videoUrls: urls!),
      podPlayerConfig: const PodPlayerConfig(
        videoQualityPriority: [360],
      ),
    )..initialise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEFC4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  color: Colors.red,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      const Center(
                        child: FittedBox(
                          child: Text(
                            'அருள்மிகு இராஜமாரியம்மன் தேவஸ்தானம்',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      const Center(
                        child: FittedBox(
                          child: Text(
                            ' ஜோகூர் பாரு 1911 ஆம் ஆண்டு முதல்',
                            style: TextStyle(color: Colors.white),
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      const Center(
                        child: FittedBox(
                          child: Text(
                            'ARULMIGU RAJAMARIAMMAN DEVASTHANAM ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      const Center(
                        child: FittedBox(
                          child: Text(
                            'Johor Bahru Since 1911',
                            style: TextStyle(color: Colors.white),
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      hGap5,
                      Column(
                        children: [
                          // Container(

                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 40,
                                    width: double.infinity,
                                  ),
                                  Container(
                                    height: 40,
                                    width: double.infinity,
                                    decoration: const ShapeDecoration(
                                      color: Color.fromARGB(255, 255, 239, 196),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(22),
                                          topRight: Radius.circular(22),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 80,
                                height: 80,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 255, 239, 196),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(50))),
                                child: Image.asset(
                                  "assets/ammannew.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),

                          Container(
                            // width: MediaQuery.of(context).size.width * 3,
                            color: const Color.fromARGB(255, 255, 239, 196),

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // FanCarouselImageSlider(
                                  //   currentItemShadow: [
                                  //     BoxShadow(blurRadius: 0)
                                  //   ],
                                  //   imagesLink: sampleImages,
                                  //   isAssets: true,
                                  //   autoPlay: true,
                                  //   sliderHeight: 450,
                                  //   imageRadius: 25,
                                  //   imageFitMode: BoxFit.fill,
                                  // ),
                                  CarouselSlider.builder(
                                    options: CarouselOptions(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.29,
                                      aspectRatio: 16 / 9,
                                      viewportFraction: 0.8,
                                      initialPage: 0,
                                      enableInfiniteScroll: true,
                                      reverse: false,
                                      autoPlay: true,
                                      autoPlayInterval:
                                          const Duration(seconds: 2),
                                      autoPlayAnimationDuration:
                                          const Duration(milliseconds: 800),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.2,
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: (index, reason) {},
                                    ),
                                    itemCount: sampleImages.length,
                                    itemBuilder: (BuildContext context,
                                        int index, int realIndex) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(22.0),
                                            child: Container(
                                              width: double.infinity,
                                              //   margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      sampleImages[index]),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  hGap10,
                                  const Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'Pooja Details',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  hGap10,
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                        yourItemList.length,
                                        (index) => HorizontalItemWidget(
                                          imagePath:
                                              yourItemList[index].imagePath,
                                          itemName:
                                              yourItemList[index].itemName,
                                          onTap: () {
                                            if (yourItemList[index].itemName ==
                                                'Time') {
                                              Get.to(
                                                  () => const Poojatimeing());
                                            } else if (yourItemList[index]
                                                    .itemName ==
                                                'Festivals') {
                                              Get.to(
                                                  () => const FestivalPage());
                                            } else if (yourItemList[index]
                                                    .itemName ==
                                                'Price') {
                                              Get.to(() => const PriceList());
                                            } else if (yourItemList[index]
                                                    .itemName ==
                                                'List') {
                                              Get.to(() => const PoojaList());
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'Devotee Services',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  hGap10,
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                        yourItemLists.length,
                                        (index) => HorizontalItemWidget1(
                                          imagePaths:
                                              yourItemLists[index].imagePaths,
                                          itemNames:
                                              yourItemLists[index].itemNames,
                                          onTaps: () {
                                            if (yourItemLists[index]
                                                    .itemNames ==
                                                'Ubayam') {
                                              Get.to(() =>
                                                  const UbayamSelectionPage());
                                            } else if (yourItemLists[index]
                                                    .itemNames ==
                                                'Annathanam') {
                                              Get.to(() =>
                                                  const AnnathanamDateSelection());
                                            } else if (yourItemLists[index]
                                                    .itemNames ==
                                                'Hall Booking') {
                                              Get.to(
                                                  () => HallDateSectionPage());
                                            } else if (yourItemLists[index]
                                                    .itemNames ==
                                                'Cash Donation') {
                                              Get.to(() =>
                                                  const DonationNewlistPage());
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  hGap10,
                                  const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Feature Videos",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      )),
                                  SizedBox(
                                      height: 170,
                                      width: double.infinity,
                                      child: youtubeList == null
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: youtubeList!.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0,
                                                          right: 8.0),
                                                  child: SizedBox(
                                                    width: 240,
                                                    height: double.infinity,
                                                    child: CustomVideoPlayer(
                                                      link: youtubeList![index]
                                                              .url ??
                                                          '',
                                                    ),
                                                  ),
                                                );
                                              },
                                            )),

                                  hGap10,
                                  const Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'Announcement',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),

                                  InkWell(
                                    onTap: () {},
                                    child: Card(
                                      elevation: 6,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Container(
                                        height: 300,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 180,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 196, 146, 146),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  12),
                                                          topRight:
                                                              Radius.circular(
                                                                  12)),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      'assets/mainslider1.jpg',
                                                    ),
                                                    fit: BoxFit.fill,
                                                  )),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15.0, top: 10),
                                              child: Text('22/02/2024'),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.0,
                                                  top: 10,
                                                  right: 10),
                                              child: Text(
                                                  'The Arulmigu Rajamariamman Temple was founded by Mr Kootha Perumal Vandayar who wanted a place to worship for the Hindus of Johor Bahru'),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 10, bottom: 10),
                                        child: Text('Announcement list'),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "View more",
                                          textHeightBehavior:
                                              TextHeightBehavior(),
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.red),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: 160,
                                    width: double.infinity,
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 5,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5.0),
                                          child: InkWell(
                                            onTap: () {},
                                            child: Card(
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Container(
                                                height: 160,
                                                width: 180,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 90,
                                                      width: 180,
                                                      decoration: const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          12),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          12)),
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                              'assets/mainslider1.jpg',
                                                            ),
                                                            fit: BoxFit.fill,
                                                          )),
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.only(
                                                        left: 5.0,
                                                        top: 3,
                                                      ),
                                                      child: Text(
                                                        '22/02/2024',
                                                        style: TextStyle(
                                                            fontSize: 8),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 29,
                                                      width: 160,
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets
                                                                .only(
                                                                left: 5.0,
                                                                top: 0,
                                                                right: 2),
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              'The Arulmigu Rajamariamman Temple was founded by Mr Kootha Perumal Vandayar who wanted a place to worship for the Hindus of Johor Bahru',
                                                              maxLines: 3,
                                                              style: TextStyle(
                                                                  fontSize: 8),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 10, bottom: 10),
                                        child: Text('Other News'),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "View more",
                                          textHeightBehavior:
                                              TextHeightBehavior(),
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.red),
                                        ),
                                      )
                                    ],
                                  ),

                                  ListView.builder(
                                    padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            final videos = '';
                            return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: VideoCard(
                                  title: 'The Arulmigu Rajamariamman Temple was founded by Mr Kootha Perumal Vandayar who wanted a place to worship for the Hindus of Johor Bahru',
                                  date:'22/02/2024',
                                  imageUrl: 'assets/mainslider1.jpg',
                                  videoUrl: '',
                                  onTap: () {
                                  Get.to(()=>VideoNews(title: 'Arulmigu', description: 'testing', subTitle:'test', vidoeUrl: 'https://www.youtube.com/watch?v=Svmvj-zNBi8', date: '22/02', imageUrl: 'assets/mainslider1.jpg', index: index, id: ''));
                                  },
                                ));
                          },
                        )]))),

                                 
                                ],
                              ),
               ] ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ));
            
            
   
  }
}

class HorizontalItemWidget extends StatefulWidget {
  final String imagePath;
  final String itemName;
  final Function onTap;
  final Color? color;

  const HorizontalItemWidget({
    Key? key,
    required this.imagePath,
    required this.itemName,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  State<HorizontalItemWidget> createState() => _HorizontalItemWidgetState();
}

class _HorizontalItemWidgetState extends State<HorizontalItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              widget.onTap();
            },
            child: Card(
              elevation: 5,
              shape: const CircleBorder(side: BorderSide.none),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.color ?? Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(child: Image.asset(widget.imagePath)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            widget.itemName,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: 'serif', fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

class ItemModel {
  final String imagePath;
  final String itemName;
  final Color? color;

  ItemModel({
    this.color,
    required this.imagePath,
    required this.itemName,
  });
}

List<ItemModel> yourItemList = [
  ItemModel(
    color: Colors.red,
    imagePath: 'assets/timer.png',
    itemName: 'Time'.tr,
  ),
  ItemModel(
    imagePath: 'assets/fest.png',
    itemName: 'Festivals'.tr,
  ),
  ItemModel(
    imagePath: 'assets/pric.png',
    itemName: 'Price'.tr,
  ),
  ItemModel(
    imagePath: 'assets/list.png',
    itemName: 'List'.tr,
  ),
];

////////////////////////////////////////////custom//////////////////////////////////////

class HorizontalItemWidget1 extends StatefulWidget {
  final String imagePaths;
  final String itemNames;
  final Function onTaps;

  const HorizontalItemWidget1({
    Key? key,
    required this.imagePaths,
    required this.itemNames,
    required this.onTaps,
  }) : super(key: key);

  @override
  State<HorizontalItemWidget1> createState() => _HorizontalItemWidget1State();
}

class _HorizontalItemWidget1State extends State<HorizontalItemWidget1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                widget.onTaps();
              },
              child: Card(
                elevation: 5,
                shape: const CircleBorder(side: BorderSide.none),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(child: Image.asset(widget.imagePaths))),
                ),
              ),
            ),
            hGap5,
            Text(
              widget.itemNames,
              style: const TextStyle(
                  fontFamily: 'serif', fontWeight: FontWeight.w400),
            ),
          ],
        ));
  }
}

class ItemModels1 {
  final String imagePaths;
  final String itemNames;

  ItemModels1({required this.imagePaths, required this.itemNames});
}

List<ItemModels1> yourItemLists = [
  ItemModels1(imagePaths: 'assets/ubayam.png', itemNames: 'Ubayam'),
  ItemModels1(imagePaths: 'assets/annathanams.png', itemNames: 'Annathanam'),
  ItemModels1(imagePaths: 'assets/donates.png', itemNames: 'Cash Donation'),
  ItemModels1(imagePaths: 'assets/hallbook.png', itemNames: 'Hall Booking'),
];
