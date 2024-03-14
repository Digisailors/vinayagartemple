import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';

class PournamiPooja extends StatefulWidget {
  const PournamiPooja({super.key});

  @override
  State<PournamiPooja> createState() => _PournamiPoojaState();
}

class _PournamiPoojaState extends State<PournamiPooja> {
  final List<CustomDataGridWidget> data = [
    CustomDataGridWidget('Jan 2024', '25', 'Thursday'),
    CustomDataGridWidget('Feb 2024', '23 ', 'Friday'),
    CustomDataGridWidget('Mar 2024', '24 ', 'Sunday'),
    CustomDataGridWidget('Apr 2024', '23', 'Tuesday'),
    CustomDataGridWidget('May 2024', '23', 'Thursday'),
    CustomDataGridWidget('Jun 2024', '21', 'Friday'),
    CustomDataGridWidget('Jul 2024', '21', 'Sunday'),
    CustomDataGridWidget('Aug 2024', '19', 'Monday'),
    CustomDataGridWidget('Sep 2024', '17', 'Tuesday'),
    CustomDataGridWidget('Oct 2024', '17', 'Thursday'),
    CustomDataGridWidget('Nov 2024', '15', 'Friday'),
    CustomDataGridWidget('Dec 2024', '14', 'Saturday'),
  ];
   final List<String> imagePaths = [
    'assets/poojatiming2.png',
    'assets/pojaslider.jpg',
    'assets/poojatiming1.png',
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
          title: Text('POURNAMI POOJA'),
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
                           'assets/sv16.jpg',
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
            
              // CarouselSlider.builder(
              //   options: CarouselOptions(
                  
              //     height: MediaQuery.of(context).size.height * 0.26,
              //     aspectRatio: 16 / 9,
              //     viewportFraction: 0.8,
              //     initialPage: 0,
              //     enableInfiniteScroll: true,
              //     reverse: true,
              //     autoPlay: true,
              //     autoPlayInterval: const Duration(seconds: 1),
              //     autoPlayAnimationDuration: const Duration(milliseconds: 800),
              //     autoPlayCurve: Curves.linear,
              //     enlargeCenterPage: true,
              //     enlargeFactor: 0.3,
              //     scrollDirection: Axis.horizontal,
              //     onPageChanged: (index, reason) {},
              //   ),
              //   itemCount: imagePaths.length,
              //   itemBuilder: (BuildContext context, int index, int realIndex) {
              //     return Builder(
              //       builder: (BuildContext context) {
              //         return ClipRRect(
                       
              //           child: Container(
              //             width:MediaQuery.of(context).size.width,
                     
              //             decoration: BoxDecoration(
              //               image: DecorationImage(
              //                 image: AssetImage(imagePaths[index]),
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //           ),
              //         );
              //       },
              //     );
              //   },
              // ),
              hGap10,
               Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
             
                    'Pournami'.tr,
                    style: hr4,
                  )),
              Container(
                width: MediaQuery.of(context).size.width*1,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text(
                

                  'Pournami Pooja is Performed on a full moon day. Those who perform this pooja can lead a contented, happy, and prosperous family life. They will receive respect and recognition from the community, will shine in their profession, and all their obstacles will be removed by Arulmigu Mariamman. Married ladies who practice Viratham on Pournami for the well-being of their family, significantly for the longevity of their husbands. The Decasthanam performs this Pournami pooja monthly as shown in this annual festival booklet. The pooja begins from 4.30 pm onwards. All devotees are urged to attend the prayer.'.tr,
                  style: const TextStyle(
                    fontSize: 14,fontFamily: 'system-ui', color: Color(0xFF391E72),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              hGap15,
              SizedBox(
                height: 450,
                child: SfDataGrid(
                  source: CustomDataGridWidgetDataSource(
                      customDataGridWidgetData: data),
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

class CustomDataGridWidget {
  CustomDataGridWidget(
    this.month,
    this.date,
    this.day,
  );

  final String month;
  final String date;
  final String day;
}

class CustomDataGridWidgetDataSource extends DataGridSource {
  CustomDataGridWidgetDataSource(
      {required List<CustomDataGridWidget> customDataGridWidgetData}) {
    _customDataGridWidgetData = customDataGridWidgetData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'Month', value: e.month),
              DataGridCell<String>(columnName: 'Date', value: e.date),
              DataGridCell<String>(columnName: 'Day', value: e.day),
            ]))
        .toList();
  }

  List<DataGridRow> _customDataGridWidgetData = [];

  @override
  List<DataGridRow> get rows => _customDataGridWidgetData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(e.value.toString()),
        );
      }).toList(),
    );
  }
}
