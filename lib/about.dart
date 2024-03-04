import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreeselvavinayagartemple/homeScreen/homepage.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';
import 'package:sreeselvavinayagartemple/widgets/customtextform.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      const Center(
                        child: FittedBox(
                          child: Text(
                            'அருள்மிகு இராஜமாரியம்மன் தேவஸ்தானம்',
                            style: TextStyle(color: Colors.white,fontSize: 15),
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      const Center(
                        child: FittedBox(
                          child: Text(
                            ' ஜோகூர் பாரு 1911 ஆம் ஆண்டு முதல்',
                            style: TextStyle(color: Colors.white,fontSize: 14),
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      const Center(
                        child: FittedBox(
                          child: Text(
                            'ARULMIGU RAJAMARIAMMAN DEVASTHANAM ',
                            style: TextStyle(color: Colors.white,fontSize: 16),
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      const Center(
                        child: FittedBox(
                          child: Text(
                            'Johor Bahru Since 1911',
                            style: TextStyle(color: Colors.white,fontSize: 15),
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                         //  height:double.infinity,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFFFEFC4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(22),
                                topRight: Radius.circular(22),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text('About',style: hb2,),
                                Center(
                                  child: SizedBox(
                                    height: 100,
                                    child: Image.asset('assets/ammannew.png')),
                                ),
                                Text('The Arulmigu Rajamariamman Temple was founded by Mr Kootha Perumal Vandayar who wanted a place to worship for the Hindus of Johor Bahru. As a community leader he approached the Sultan for a piece of land to build a Hindu Temple. His Royal Highness Sultan of Johor, Sir Sultan Ibrahim Ibni Sultan Abu Bakar gave an acre of land and RM500 to the founder on 22 Mac 1911 to build a temple at Jalan Ungku Puan, Johor Bahru. \n \nIn honour of His Royal Highness generous donation, the word “ RAJA” was added to the temple’s name, as the temple originally known as Mariamman Temple.The first Perum Santhi Vizha took place on 8.12.1911 and from then onwards the temple started to grow. The second Perum Santhi Vizha took place in the year 1935 after some changes were done to the temple.In 1949, the temple was registered under the Society Ordinance as ‘Rajamariamman Kovil’. \n \n Between 1950-56, the temple was managed by by two committees, one for temple affairs and the other for Hindu religious affairs. The two committees were amalgamated into a Single Rajamariamman Temple Committee in 1956. During the same period, Iyer was appointed replacing pandarams to perform pooja and weddings. A brick wall surrounding the temple was also built in the same year.\n \nSince the temple had no major renovation for the last 51 years.\n \n At the end of 1977 the Temple Management committee under the leadership of President, Mr. A.Thambyayah PIS,PLP a historic decision to rebuild the temple was made. At its Annual General Meeting in 1979 a resolation was passed to appoint a committee under Mr.J.Kanapathy PIS,PPN and fourteen others for the rebuilding of the temple. It took 6 years to rebuild the temple. At the new temple the management Committee decided to have additional deites such as Sri Vairavan, Rajagopuram and Kodimaram ( Flag staff)',style: hb14,),
                                 hGap10,
                                        Center(
                                          child: CustomElevatedButton(
                                            onPressed: () {
                                              Get.to(() => Homepage());
                                            },
                                            child: const Text(
                                              'Next',
                                              style: h2,
                                            ),
                                          ),
                                        )],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}