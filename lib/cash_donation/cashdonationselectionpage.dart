import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';

class CashDonationChoosePage extends StatefulWidget {
  const CashDonationChoosePage({super.key});

  @override
  State<CashDonationChoosePage> createState() => _CashDonationChoosePageState();
}

class _CashDonationChoosePageState extends State<CashDonationChoosePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
          backgroundColor: Colors.red,
          title:  Center(child: Text('Cash Donation'.tr,style: h2,)),
          actions: [ PopupMenuButton<int>(
                icon: const Icon(Icons.language, color: Color.fromARGB(255, 69, 67, 67)),
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
              )],
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}