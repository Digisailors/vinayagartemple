import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreeselvavinayagartemple/profile/member_profile.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';


class SecondHomepage extends StatefulWidget {
  const SecondHomepage({super.key});

  @override
  State<SecondHomepage> createState() => _SecondHomepageState();
}

class _SecondHomepageState extends State<SecondHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            const Center(
              child: FittedBox(
                child: Text(
                  'அருள்மிகு இராஜமாரியம்மன் தேவஸ்தானம்',
                  style: TextStyle(color: Colors.white,fontSize:15,fontWeight:FontWeight.bold),
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
                  style: TextStyle(color: Colors.white,fontSize:16,fontWeight:FontWeight.bold),
                ),
                fit: BoxFit.scaleDown,
              ),
            ),
            const Center(
              child: FittedBox(
                child: Text(
                  'johor bahru Since 1911',
                  style: TextStyle(color: Colors.white),
                ),
                fit: BoxFit.scaleDown,
              ),
            ),
            hGap15,
            Column(
              children: [
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
                          //color: Colors.white,
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
                          // image: DecorationImage(
                          //   image:
                          //       AssetImage('assets/ammannew.png'),
                          //   fit: BoxFit.contain,
                          // ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))
                          // shape: OvalBorder(),
                          ),
                      child: Image.asset(
                        "assets/ammannew.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                Container(
                  // width: MediaQuery.of(context).size.width * 0.98,
                  height: MediaQuery.of(context).size.height * 0.7,
                  //height: double.infinity,
                  color: Color.fromARGB(255, 255, 239, 196),
                  // decoration: const ShapeDecoration(
                  //   color: Colors.white,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(22),
                  //       topRight: Radius.circular(22),
                  //     ),
                  //   ),
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // FanCarouselImageSlider(
                        //   imagesLink: sampleImages,
                        //   isAssets: true,
                        //   autoPlay: true,
                        //   sliderHeight: 400,
                        // ),
                        hGap30,
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            '',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        hGap30,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // HorizontalItemWidget1(
                                //   imagePath: 'assets/icons_phone.png',
                                //   itemName: 'Contact',
                                //   onTap: () {
                                //     Get.to(() => ContactPage());
                                //   },
                                // ),
                                    HorizontalItemWidget1(
                                  imagePath: 'assets/profile.png',
                                  itemName: 'Profile',
                                  onTap: () {
                                    Get.to(() => MemberProfileView());
                                  },
                                ),
                                 HorizontalItemWidget1(
                                  imagePath: 'assets/logout.png',
                                  itemName: 'Logout',
                                  onTap: () {
                                 
                                  },
                                )
                              ]
                              ),
                        ),
                         SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // HorizontalItemWidget1(
                                //   imagePath: 'assets/logout.png',
                                //   itemName: 'Contact',
                                //   onTap: () {
                                //     Get.to(() => ContactPage());
                                //   },
                                // ),
                                //     HorizontalItemWidget1(
                                //   imagePath: 'assets/profile.png',
                                //   itemName: 'Profile',
                                //   onTap: () {
                                //     Get.to(() => MemberProfileView());
                                //   },
                                // ),
                                 HorizontalItemWidget1(
                                  imagePath: 'assets/delete.png',
                                  itemName: 'Remove Account',
                                  onTap: () {
                                     
                                  },
                                )
                              ]

                              ),
                        ),
                        hGap40,
                      ],
                    ),
                  ),
                ),
                // Flexible(child: Container())
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalItemWidget1 extends StatefulWidget {
  final String imagePath;
  final String itemName;
  final Function onTap;

  const HorizontalItemWidget1({
    Key? key,
    required this.imagePath,
    required this.itemName,
    required this.onTap,
  }) : super(key: key);

  @override
  State<HorizontalItemWidget1> createState() => _HorizontalItemWidgetState();
}

class _HorizontalItemWidgetState extends State<HorizontalItemWidget1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
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
                      shape: BoxShape.circle, color: Colors.white),
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(child: Image.asset(widget.imagePath))),
                ),
              ),
            ),
            hGap5,
            Text(widget.itemName),
          ],
        ));
  }
}

class ItemModel {
  final String imagePath;
  final String itemName;

  ItemModel({required this.imagePath, required this.itemName});
}

List<ItemModel> yourItemList = [
  ItemModel(imagePath: 'assets/poojatimev.png', itemName: 'Poojatiming'.tr),
   ItemModel(imagePath: 'assets/fesv.png', itemName: 'Festival'.tr),

 
  // ItemModel(imagePath: 'assets/pricev.png', itemName: 'Pooja Price'.tr),
  // ItemModel(imagePath: 'assets/poojalistv.png', itemName: 'Pooja List'.tr),
];

class menulisitcards extends StatefulWidget {
  final String imagePath;
  final String itemName;
  final Function onTap;

  const menulisitcards({
    Key? key,
    required this.imagePath,
    required this.itemName,
    required this.onTap,
  }) : super(key: key);

  @override
  State<menulisitcards> createState() => _menulisitcardsState();
}

class _menulisitcardsState extends State<menulisitcards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundColor: Color.fromARGB(26, 120, 118, 118),
            child: GestureDetector(
              onTap: () {
                widget.onTap();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(26, 52, 212, 70),
                  radius: 25,
                  foregroundImage: AssetImage(widget.imagePath),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(widget.itemName),
        ],
      ),
    );
  }
}
