import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:sreeselvavinayagartemple/pooja%20list/pournami.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';

class Bairawarpoja extends StatefulWidget {
  const Bairawarpoja({super.key});

  @override
  State<Bairawarpoja> createState() => _BairawarpojaState();
}

class _BairawarpojaState extends State<Bairawarpoja> {
    final List<CustomDataGridWidget> data2 = [
    CustomDataGridWidget('Jan 2024', '04', 'Thursday'),
    CustomDataGridWidget('Feb 2024', '02 ', 'Friday'),
    CustomDataGridWidget('Mar 2024', '03 ', 'Sunday'),
    CustomDataGridWidget('Apr 2024', '01', 'Monday'),
    CustomDataGridWidget('May 2024', '01', 'Wednesday'),
     CustomDataGridWidget('May 2024', '30', 'Thursday'),
    CustomDataGridWidget('Jun 2024', '28', 'Friday'),
    CustomDataGridWidget('Jul 2024', '28', 'Sunday'),
    CustomDataGridWidget('Aug 2024', '26', 'Monday'),
    CustomDataGridWidget('Sep 2024', '24', 'Tuesday'),
    CustomDataGridWidget('Oct 2024', '24', 'Thursday'),
    CustomDataGridWidget('Nov 2024', '23', 'Saturday'),
    CustomDataGridWidget('Dec 2024', '22', 'Sunday'),
  ];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Color(0xFFE4F5FF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 20),
        child: AppBar(
          backgroundColor: Color(0xFF006CA7),
          title: Text('BAIRAWAR POOJA'),
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22)),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width*1,
                  height: MediaQuery.of(context).size.height*0.25,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      image: const DecorationImage(
                          image: AssetImage(
                           'assets/sv18.jpg',
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
              hGap10,
               Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Bairawar Pooja'.tr,
                    style: hr4,
                  )),
                  hGap10,
              Container(
                width: MediaQuery.of(context).size.width*1,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text(
                  'Lord Bairavar is the manifestation of lord shiva who manages the time and guards ur from all evil.He also the guardian of travellers.Worshipping of lord bhairavar is very much essential to win over your enemies,success and all materialistic comforts.He protects ,removes all obstacles,cleans the soul with his sheer intensity and makes things favourable.He is the most feared deties but he is the most rewarding.The Devasthanam performs Thei Pirai special prayers every month during asthami for Lord Bairavar as shown in this annual festival Booklet.The pooja begins from 7.00pm onwards.All devotees are urged to attend this prayers.'.tr,
                  style: const TextStyle(
                    fontSize: 14,fontFamily: 'Inter', color: Color(0xFF391E72),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              hGap15,
              SizedBox(
                height: 450,
                child: SfDataGrid(
                  source: CustomDataGridWidgetDataSource(
                      customDataGridWidgetData: data2),
                  columnWidthMode: ColumnWidthMode.fill,
                  columns: <GridColumn>[
                    GridColumn(
                      columnName: 'Month',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Month / Year'),
                      ),
                    ),
                    GridColumn(
                      columnName: 'Date',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Date'),
                      ),
                    ),
                    GridColumn(
                      columnName: 'Day',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Day'),
                      ),
                    ),
                  ],
                ),
              ),
              hGap10
            ],
          ),
        ),
      ),
    );
  }
}