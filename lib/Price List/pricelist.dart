import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';

class PriceList extends StatefulWidget {
  const PriceList({super.key});

  @override
  State<PriceList> createState() => _PriceListState();
}

class _PriceListState extends State<PriceList> {
  final String bulletPointText1 =
      'Devotees are requested to obtain a receipt for RM1.00 for Saree offerings at the ticket counter.';
  final String bulletPointText2 =
      'Please note that special pooja can be performed for your birthday, wedding anniversary and other auspicious occasions. Please contact the office for details. Special Festival Days, normal poojas and prayers time is subject to change.';
  final String bulletPointText3 =
      'Devotees are requested to obtain a receipt for all payments and donation.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color(0xFFE4F5FF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight +4),
        child: AppBar(
          backgroundColor: Color(0xFF006CA7),
          title: Text('Pooja Price'),
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
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22)),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    color: Color(0xFF79D0FF),

                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                       BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 2,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'CHARGES FOR POOJAS, HOMAMS AND ABISHEGAM'.tr,
                        style: h4,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              CUstomPriceCard(
                  serialnumber: '1',
                  title: 'Banana Archanai'.tr,
                  rm: 'RM3.00'),
              CUstomPriceCard(
                  serialnumber: '2',
                  title: 'Coconut Archanai'.tr,
                  rm: 'RM5.00'),
              CUstomPriceCard(
                  serialnumber: '3', title: 'Ghee Lamp'.tr, rm: 'RM2.00'),
              CUstomPriceCard(
                  serialnumber: '4', title: 'Prasadham'.tr, rm: 'RM30.00'),
              CUstomPriceCard(
                  serialnumber: '5', title: 'Seer Archanai'.tr, rm: 'RM11.00'),
              CUstomPriceCard(
                  serialnumber: '6',
                  title: 'Sanishwaran Ellu Vilaku'.tr,
                  rm: 'RM6.00'),
              CUstomPriceCard(
                  serialnumber: '7', title: 'Motcha Deepam'.tr, rm: 'RM10.00'),
              CUstomPriceCard(
                  serialnumber: '8',
                  title: 'Prayers for New Motors(Motorcycle)'.tr,
                  rm: 'RM21.00'),
              CUstomPriceCard(
                  serialnumber: '9',
                  title: 'Prayers for New Vehicle(Car)'.tr,
                  rm: 'RM51.00'),
              CUstomPriceCard(
                  serialnumber: '10',
                  title: 'Bairavar Melagu Deepam'.tr,
                  rm: 'RM10.00'),
              CUstomPriceCard(
                  serialnumber: '11',
                  title: 'Padikattu Abishegam'.tr,
                  rm: 'RM151.00'),
              CUstomPriceCard(
                  serialnumber: '12',
                  title: 'Sahasra Nama Archani'.tr,
                  rm: 'RM151.00'),
              CUstomPriceCard(
                  serialnumber: '13',
                  title: 'Santhanam/Viputhi Kappu(for face only)'.tr,
                  rm: 'RM151.00'),
              CUstomPriceCard(
                  serialnumber: '14',
                  title: 'Rudhra Abishegam + pooja(one kumbam)'.tr,
                  rm: 'RM301.00'),
              CUstomPriceCard(
                  serialnumber: '15',
                  title: 'Stabana Abishegam + Homam and Pooja(11 kumbam)'.tr,
                  rm: 'RM1251.00'),
              CUstomPriceCard(
                  serialnumber: '16',
                  title: 'Navagiraga Shanthi'.tr,
                  rm: 'RM1251.00'),
              CUstomPriceCard(
                  serialnumber: '17',
                  title: 'Sangabishegam + Pooja(108 sangu)'.tr,
                  rm: 'RM1501.00'),
              CUstomPriceCard(
                  serialnumber: '18',
                  title: 'Mudikkairu Archanai'.tr,
                  rm: 'RM11.00'),
              CUstomPriceCard(
                  serialnumber: '19',
                  title: 'Thathu Koduthal'.tr,
                  rm: 'RM101.00'),
              CUstomPriceCard(
                  serialnumber: '20', title: 'Gho Pooja'.tr, rm: 'RM351.00'),
              CUstomPriceCard(
                  serialnumber: '21',
                  title: 'Padam Archanai'.tr,
                  rm: 'RM5.00'),
              CUstomPriceCard(
                  serialnumber: '22',
                  title: 'Garland Sponsor + Padikattu Abishegam'.tr,
                  rm: 'RM451.00'),
              CUstomPriceCard(
                  serialnumber: '23',
                  title: 'Garland Sponsor Only'.tr,
                  rm: 'RM301.00'),
               
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 25,
                          color: Color(0x3F000000),
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ]),
                  child: Column(
                    children: [
                      BulletPoint(text: bulletPointText1.tr),
                      BulletPoint(text: bulletPointText2.tr),
                      BulletPoint(text: bulletPointText3.tr),
                         Text('Thank you'.tr,style: const TextStyle(color: Colors.black),),
                  Text('Management Committee'.tr,style: const TextStyle(color: Colors.black),),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CUstomPriceCard extends StatelessWidget {
  final String serialnumber;
  final String title;
  final String rm;

  CUstomPriceCard(
      {required this.serialnumber, required this.title, required this.rm});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 251, 241, 241),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 3,
                offset: Offset(0, 2),
                spreadRadius: 0,
              ),
            ],
          ),
          child: ListTile(
            leading: Text(serialnumber),
            title: Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 14,fontFamily: 'Poppins'),
            ),
            trailing: Text(rm),
          ),
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, right: 8),
            child: const Icon(
              Icons.circle,
              size: 10,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Text(
             
              text,
              style: hb14,
            ),
          )
        ],
      ),
    );
  }
}
