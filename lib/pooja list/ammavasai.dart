import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:sreeselvavinayagartemple/pooja%20list/pournami.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';

class AmmavasaiPage extends StatefulWidget {
  const AmmavasaiPage({super.key});

  @override
  State<AmmavasaiPage> createState() => _AmmavasaiPageState();
}

class _AmmavasaiPageState extends State<AmmavasaiPage> {
  final List<CustomDataGridWidget> data1 = [
    CustomDataGridWidget('Jan 2024', '11', 'Thursday'),
    CustomDataGridWidget('Feb 2024', '09 ', 'Friday'),
    CustomDataGridWidget('Mar 2024', '10 ', 'Sunday'),
    CustomDataGridWidget('Apr 2024', '08', 'Monday'),
    CustomDataGridWidget('May 2024', '07', 'Tuesday'),
    CustomDataGridWidget('Jun 2024', '06', 'Thursday'),
    CustomDataGridWidget('Jul 2024', '05', 'Friday'),
    CustomDataGridWidget('Aug 2024', '04', 'Sunday'),
    CustomDataGridWidget('Sep 2024', '02', 'Monday'),
    CustomDataGridWidget('Oct 2024', '02', 'Wednesday'),
    CustomDataGridWidget('Nov 2024', '01', 'Friday'),
    CustomDataGridWidget('Nov 2024', '30', 'Saturday'),
    CustomDataGridWidget('Dec 2024', '30', 'Monday'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Color(0xFFE4F5FF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 20),
        child: AppBar(
          backgroundColor: Color(0xFF006CA7),
          title: Text('AMMAVASAI POOJA'),
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
     body:SingleChildScrollView(
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
                             'assets/sv17.jpg',
                            ),
                            fit: BoxFit.fill)),
                  ),
                ),
                hGap10,
               Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Ammavasai'.tr,
                      style: hr4,
                    )),
                         hGap15,
                SizedBox(
                  height: 450,
                  child: SfDataGrid(
                    source: CustomDataGridWidgetDataSource(
                        customDataGridWidgetData: data1),
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
                hGap10
          ],
        ),
      ),
     ) ,
      );
  }
}
