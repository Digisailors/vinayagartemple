import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:sreeselvavinayagartemple/pooja%20list/pournami.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';

class Gohpooja extends StatefulWidget {
  const Gohpooja({super.key});

  @override
  State<Gohpooja> createState() => _GohpoojaState();
}

class _GohpoojaState extends State<Gohpooja> {
  final List<CustomDataGridWidget> data3 = [
    CustomDataGridWidget('Jan 2024', '05', ' 1st Friday'),
    CustomDataGridWidget('Feb 2024', '02 ', ' 1st Friday'),
    CustomDataGridWidget('Mar 2024', '01 ', ' 1st Friday'),
    CustomDataGridWidget('Apr 2024', '05', ' 1st Friday'),
    CustomDataGridWidget('May 2024', '03', '1st Friday'),
    CustomDataGridWidget('Jun 2024', '07', ' 1st Friday'),
    CustomDataGridWidget('Jul 2024', '05', ' 1st Friday'),
    CustomDataGridWidget('Aug 2024', '02', '1st Friday'),
    CustomDataGridWidget('Sep 2024', '06', '1st Friday'),
    CustomDataGridWidget('Oct 2024', '04', '1st Friday'),
    CustomDataGridWidget('Nov 2024', '01', '1st Friday'),
    CustomDataGridWidget('Dec 2024', '06', '1st Friday'),
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
          title: Text('GHO POOJA'),
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
                         'assets/sv21.jpg',
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
              hGap10,
               Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Gho Pooja'.tr,
                    style: hr4,
                  )),
                  hGap10,
              Container(
                width:MediaQuery.of(context).size.width*1,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: AutoSizeText(
                   'Blessed Devotees, there will be a GHO pooja or pooja for the sacred Cow, every first Friday of the month. It is said in the Vedas that all GODS, GODDESS, including the Trinity has thier adobe in the COW. There is around 36 divine beings who have taken abode in the body of the cow. So it is a sin to harm it and must be treated with reverence. It is very auspicious to worship and perform Cow pooja on Fridays.'.tr,
                  style: const TextStyle(
                    fontSize: 16,fontFamily: 'Inter', color: Color(0xFF391E72),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              hGap15,
              SizedBox(
                height: 450,
                child: SfDataGrid(
                  source: CustomDataGridWidgetDataSource(
                      customDataGridWidgetData: data3),
                  columnWidthMode: ColumnWidthMode.fill,
                  columns: <GridColumn>[
                    GridColumn(
                      columnName: 'Month',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const AutoSizeText('Month / Year'),
                      ),
                    ),
                    GridColumn(
                      columnName: 'Date',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const AutoSizeText('Date'),
                      ),
                    ),
                    GridColumn(
                      columnName: 'Day',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const AutoSizeText('Day'),
                      ),
                    ),
                  ],
                ),
              ),
              hGap30
            ],
          ),
        ),
      ),
    );
  }

}