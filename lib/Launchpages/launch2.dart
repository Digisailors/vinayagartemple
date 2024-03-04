import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreeselvavinayagartemple/Launchpages/launch3.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';
import 'package:sreeselvavinayagartemple/widgets/customtextform.dart';

class LaunchPage2 extends StatefulWidget {
  const LaunchPage2({super.key});

  @override
  State<LaunchPage2> createState() => _LaunchPage2State();
}

class _LaunchPage2State extends State<LaunchPage2> {
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
              const Center(child: Text('ARULMIGU RAJAMARIAMMAN DEVASTHANAM ',style: hr4,)),
                const Center(child: Text('Johor Bahru Since 1911',style: hr5,)),
                const Center(child: Text('அருள்மிகு இராஜமாரியம்மன் தேவஸ்தானம்',style: hr5,)),
                const Center(child: Text(' ஜோகூர் பாரு 1911 ஆம் ஆண்டு முதல்',style: hr3,)),
                hGap10,
                Center(
                  child: SizedBox(
                
                    child: Card(
                      color: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                      
                      child: SizedBox(
                         height: MediaQuery.of(context).size.height*0.66,
                        width: MediaQuery.of(context).size.width*0.8,
                        child: Column(
                          children: [
                              Image.asset('assets/launch1.png'),
                            const Center(child: Text('Take a Devotional Journy',style: hr4,)),
                            hGap10,
                                    const Center(child: Text('Experience the Exceptional',style: hb3,)),
                                    hGap10,
                                    const Center(child: Text('Engagement of Devotion',style: hb3,)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                hGap10,
                Center(
                  child: CustomElevatedButton(
                    onPressed: (){
                      Get.to(()=>const LaunchPage3());
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