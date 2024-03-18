import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';
import 'package:sreeselvavinayagartemple/Annadhanam/annathanam_date_selection.dart';
import 'package:sreeselvavinayagartemple/Price%20List/pricelist.dart';
import 'package:sreeselvavinayagartemple/aa_model/videolistmodel.dart';

import 'package:sreeselvavinayagartemple/donation/donationlistnew.dart';
import 'package:sreeselvavinayagartemple/festivals/festivalcalender.dart';
import 'package:sreeselvavinayagartemple/hall_booking/hallDateSectionpage.dart';

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
    'assets/vinayagar.jpeg',
    'assets/sv44.jpg',
    'assets/sv1.jpg',
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

     backgroundColor: Color(0xFFE4F5FF),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Color.fromARGB(255, 201, 234, 251),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22)),
              ),
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Padding(
                  padding: const EdgeInsets.only(top: 80, right: 85),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: RichText(
                      text: TextSpan(
                        text: 'SREE SELVA VINAYAGAR ',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'TEMPLE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                background: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.asset(
                    'assets/hometopbar.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Column(
                children: [
                  Container(
                      color: Color(0xCEEEFF),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                hGap10,
                                const Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Categories',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
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
                                        itemName: yourItemList[index].itemName,
                                        onTap: () {
                                          if (yourItemList[index].itemName ==
                                              'Time') {
                                            Get.to(() => const Poojatimeing());
                                          } else if (yourItemList[index]
                                                  .itemName ==
                                              'Festivals') {
                                            Get.to(() => const FestivalPage());
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
                                          if (yourItemLists[index].itemNames ==
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
                                            Get.to(() => HallDateSectionPage());
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
                                // const Align(
                                //     alignment: Alignment.centerLeft,
                                //     child: Text(
                                //       "Feature Videos",
                                //       style: TextStyle(
                                //         color: Colors.black,
                                //         fontSize: 20,
                                //         fontFamily: 'Poppins',
                                //         fontWeight: FontWeight.w200,
                                //         height: 0,
                                //       ),
                                //     )),
                                // SizedBox(
                                //     height: 170,
                                //     width: double.infinity,
                                //     child: youtubeList == null
                                //         ? const Center(
                                //             child:
                                //                 CircularProgressIndicator(),
                                //           )
                                //         : ListView.builder(
                                //             scrollDirection:
                                //                 Axis.horizontal,
                                //             itemCount:
                                //                 youtubeList!.length,
                                //             itemBuilder:
                                //                 (context, index) {
                                //               return Padding(
                                //                 padding:
                                //                     const EdgeInsets
                                //                         .only(
                                //                         left: 8.0,
                                //                         right: 8.0),
                                //                 child: SizedBox(
                                //                   width: 240,
                                //                   height: double
                                //                       .infinity,
                                //                   child:
                                //                       CustomVideoPlayer(
                                //                     link: youtubeList![
                                //                                 index]
                                //                             .url ??
                                //                         '',
                                //                   ),
                                //                 ),
                                //               );
                                //             },
                                //           )),
                                hGap10,

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.0, right: 10, bottom: 10),
                                      child: Text(
                                        'Announcement',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w300,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                         
                                      },
                                      child: const Text(
                                        "View more",
                                        textHeightBehavior:
                                            TextHeightBehavior(),
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black,fontWeight: FontWeight.w300, fontFamily: 'Poppins',),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 180,
                                  width: double.infinity,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5.0),
                                        child: InkWell(
                                          onTap: () {

                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 210,
                                                width: 190,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/sv13.jpg'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                left: 0,
                                                child: Container(
                                                  height: 60,
                                                  width: 190,
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8.0),
                                                    child: Text(
                                                      ' SREE SELVA VINAYAGA TEMPLE',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.white),
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                hGap20,
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     const Padding(
                                //       padding: EdgeInsets.only(
                                //           left: 10.0, right: 10, bottom: 10),
                                //       child: Text('Other News'),
                                //     ),
                                //     TextButton(
                                //       onPressed: () {},
                                //       child: const Text(
                                //         "View more",
                                //         textHeightBehavior:
                                //             TextHeightBehavior(),
                                //          style: TextStyle(
                                //             fontSize: 16, color: Colors.black,fontWeight: FontWeight.w300, fontFamily: 'Poppins',),
                                //       ),
                                //     )
                                //   ],
                                // ),
                                // ListView.builder(
                                //   padding: EdgeInsets.zero,
                                //   shrinkWrap: true,
                                //   physics: const NeverScrollableScrollPhysics(),
                                //   itemCount: 5,
                                //   itemBuilder:
                                //       (BuildContext context, int index) {
                                //     final videos = '';
                                //     return Padding(
                                //         padding: const EdgeInsets.all(10.0),
                                //         child: VideoCard(
                                //           title:
                                //               'The Arulmigu Rajamariamman Temple was founded by Mr Kootha Perumal Vandayar who wanted a place to worship for the Hindus of Johor Bahru',
                                //           date: '22/02/2024',
                                //           imageUrl: 'assets/vinayagar.jpeg',
                                //           videoUrl: '',
                                //           onTap: () {
                                //             Get.to(() => VideoNews(
                                //                 title: 'Arulmigu',
                                //                 description: 'testing',
                                //                 subTitle: 'test',
                                //                 vidoeUrl:
                                //                     'https://www.youtube.com/watch?v=Svmvj-zNBi8',
                                //                 date: '22/02',
                                //                 imageUrl:
                                //                     'assets/mainslider1.jpg',
                                //                 index: index,
                                //                 id: ''));
                                //           },
                                //         ));
                                //   },
                                // )
                              ]))),
                ],
              ),
            ]))
          ],
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Container(
                height: 60,
                width: 60,
                
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
                fontFamily: 'Poppins', fontWeight: FontWeight.w200),
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
    imagePath: 'assets/htime.png',
    itemName: 'Time'.tr,
  ),
  ItemModel(
    imagePath: 'assets/hfestival.png',
    itemName: 'Festivals'.tr,
  ),
  ItemModel(
    imagePath: 'assets/hprice.png',
    itemName: 'Price'.tr,
  ),
  ItemModel(
    imagePath: 'assets/hlist.png',
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Image.asset(widget.imagePaths))),
                    ),
                  ],
                ),
              ),
            ),
            hGap5,
            Text(
              widget.itemNames,
              style: const TextStyle(
                  fontFamily: 'Poppins', fontWeight: FontWeight.w200),
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
  ItemModels1(imagePaths: 'assets/hubayam.png', itemNames: 'Ubayam'),
  ItemModels1(imagePaths: 'assets/hannadhanam.png', itemNames: 'Annathanam'),
  ItemModels1(imagePaths: 'assets/hdonation.png', itemNames: 'Cash Donation'),
  ItemModels1(imagePaths: 'assets/hhall.png', itemNames: 'Hall Booking'),
];
/////////////////////////////////////
///
///
///
///
///
///

