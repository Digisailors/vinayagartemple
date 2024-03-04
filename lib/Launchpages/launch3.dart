import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreeselvavinayagartemple/about.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';
import 'package:sreeselvavinayagartemple/widgets/customtextform.dart';

class LaunchPage3 extends StatefulWidget {
  const LaunchPage3({super.key});

  @override
  State<LaunchPage3> createState() => _LaunchPage3State();
}

class _LaunchPage3State extends State<LaunchPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEFC4),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Image.asset(
                  'assets/amman.png',
                  width: MediaQuery.of(context).size.width*0.10,
                height: MediaQuery.of(context).size.height*0.1,
                  fit: BoxFit.scaleDown,
                )),
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
                          borderRadius: BorderRadius.circular(8)),
                      child: SizedBox(
                            height: MediaQuery.of(context).size.height*.8,
                        width: MediaQuery.of(context).size.width*0.85,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 400,
                              child: Image.asset('assets/ammannew.png')),
                            const Center(
                                child: Text(
                              'ARULMIGU RAJAMARIAMMAN DEVASTHANAM',
                              style: hr3,
                            )),
                            hGap10,
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                'The Arulmigu Rajamariamman Temple was founded by Mr Kootha Perumal Vandayar who wanted a place to worship for the Hindus of Johor Bahru. As a community leader he approached the Sultan for a piece of land to build a Hindu Temple. His Royal Highness Sultan of Johor, Sir Sultan Ibrahim Ibni Sultan Abu Bakar gave an acre of land and RM500 to the founder on 22 Mac 1911 to build a temple at Jalan Ungku Puan, Johor Bahru. In honour of His Royal Highness generous donation, the word “ RAJA” was added to the temple’s name, as the temple originally known as Mariamman Temple.',
                                style: hb3,
                                textAlign: TextAlign.justify,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                hGap10,
                Center(
                  child: CustomElevatedButton(
                    onPressed: () {
                      Get.to(() => AboutPage());
                    },
                    child: const Text(
                      'Next',
                      style: h2,
                    ),
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
