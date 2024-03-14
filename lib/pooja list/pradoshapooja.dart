import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:sreeselvavinayagartemple/pooja%20list/pournami.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';

class PradoshaPoojaPage extends StatefulWidget {
  const PradoshaPoojaPage({super.key});

  @override
  State<PradoshaPoojaPage> createState() => _PradoshaPoojaPageState();
}

class _PradoshaPoojaPageState extends State<PradoshaPoojaPage> {
    final List<CustomDataGridWidget> data4 = [
    CustomDataGridWidget('Jan 2024', '09', 'Tuesday'),
     CustomDataGridWidget('Jan 2024', '23', 'Tuesday'),
    CustomDataGridWidget('Feb 2024', '07 ', 'Wednesday'),
     CustomDataGridWidget('Feb 2024', '21 ', 'Wednesday'),

    CustomDataGridWidget('Mar 2024', '08 ', 'Friday'),
     CustomDataGridWidget('Mar 2024', '22 ', 'Friday'),
    CustomDataGridWidget('Apr 2024', '06', 'Saturday'),
       CustomDataGridWidget('Apr 2024', '21', 'Sunday'),
    CustomDataGridWidget('May 2024', '05', 'Sunday'),
       CustomDataGridWidget('May 2024', '20', 'Monday'),
  CustomDataGridWidget('Jun 2024', '04', 'Tuesday'),
    CustomDataGridWidget('Jun 2024', '19', 'Wednesday'),
    CustomDataGridWidget('Jul 2024', '03', 'Wednesday'),
     CustomDataGridWidget('Jul 2024', '19', 'Friday'),
    CustomDataGridWidget('Aug 2024', '01', 'Thursday'),
     CustomDataGridWidget('Aug 2024', '17', 'Saturday'),
      CustomDataGridWidget('Aug 2024', '31', 'Saturday'),
    CustomDataGridWidget('Sep 2024', '15', 'Sunday'),
      CustomDataGridWidget('Sep 2024', '30', 'Monday'),
    CustomDataGridWidget('Oct 2024', '15', 'Tuesday'),
     CustomDataGridWidget('Oct 2024', '29', 'Tuesday'),
    CustomDataGridWidget('Nov 2024', '13', 'Wednesday'),
     CustomDataGridWidget('Nov 2024', '28', 'Thursday'),
    CustomDataGridWidget('Dec 2024', '13', 'Friday'),
     CustomDataGridWidget('Dec 2024', '28', 'Saturday'),
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
          title: Text('PRADOSHA POOJA'),
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
                      image: DecorationImage(
                          image: AssetImage(
                           'assets/sv19.jpg',
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
              hGap10,
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Pradosha Pooja'.tr,
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
                  'Pradosha pooja is one of the most important poojas perfromed to the graceful Lord Shiva. It is practised as a bitmonthly occasion on the thirteenth day of every fortnight of The Hindu calendar. It is beleived that worshipping Lord Shiva on pradhosam will free us from sins,gives moksha and will also be granted wordly treasures. The Desvasthanam observes this pradosha pooja as shown in the annual festival booklet. The pooja begins from 4pm onwards. All devotees are urged to attend this prayer.'.tr,
                  style: TextStyle(
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
                      customDataGridWidgetData: data4),
                  columnWidthMode: ColumnWidthMode.fill,
                  columns: <GridColumn>[
                    GridColumn(
                      columnName: 'Month',
                      label: Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Text('Month / Year'),
                      ),
                    ),
                    GridColumn(
                      columnName: 'Date',
                      label: Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Text('Date'),
                      ),
                    ),
                    GridColumn(
                      columnName: 'Day',
                      label: Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Text('Day'),
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