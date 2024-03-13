import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreeselvavinayagartemple/Launchpages/launchnewpage.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';
import 'package:sreeselvavinayagartemple/widgets/customtextform.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
    final List<String> imagePaths = [
    'assets/c1.png',
    'assets/c2.png',
    'assets/c3.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFEFC4),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

 Center(child: Image.asset('assets/amman.png',
                width: MediaQuery.of(context).size.width*0.10,
                height: MediaQuery.of(context).size.height*0.12,
                fit: BoxFit.scaleDown,)),
                hGap15,
                    const Center(child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('அருள்மிகு இராஜமாரியம்மன் தேவஸ்தானம்',style: hr6,maxLines: 1,))),
                const Center(child: Text(' ஜோகூர் பாரு 1911 ஆம் ஆண்டு முதல்',style: hr3,)),
                const Center(child: Text('ARULMIGU RAJAMARIAMMAN DEVASTHANAM ',style: hr6,maxLines: 1,)),
                const Center(child: Text('Johor Bahru Since 1911',style: hr5,)),
            
                hGap10,
                
                  CarouselSlider.builder(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.6,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 2,
                  enableInfiniteScroll: true,

                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 2000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {},
                ),
                itemCount: imagePaths.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.2,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imagePaths[index]),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
               
                // Center(
                //   child: SizedBox(
                   
                //     child: Card(
                //       color: Colors.white,
                //       elevation: 2,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(8)
                //       ),
                      
                //       child: SizedBox(
                //         height: MediaQuery.of(context).size.height*0.65,
                //         width: MediaQuery.of(context).size.width*0.8,
                //         child: Column(
                //           children: [
                //             Image.asset('assets/launch1.png'),
                //             const Center(child: Text('Welcome to ARMD ',style: hr4,)),
                //             hGap10,
                //                     const Center(child: Text('A Portal of Spirituality !',style: hb3,)),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                hGap10,
                Center(
                  child: CustomElevatedButton(
                    onPressed: (){
                      Get.offAll(()=> LaunchNewPage());
                    },
                    child: Text('Next',style: h2,),
                
                  ),
                )
              
                
              ],
            ),
          ),
          
        ),
      ),
    );
  }
}