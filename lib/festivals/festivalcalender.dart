import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';


class FestivalPage extends StatefulWidget {
  const FestivalPage({super.key});

  @override
  State<FestivalPage> createState() => _FestivalPageState();
}

class _FestivalPageState extends State<FestivalPage> {
  List<String> monthNames = [
    'JANUARY / ஜனவரி',
    'FEBRUARY / பிப்ரவரி',
    'MARCH / மார்ச்',
    'APRIL / ஏப்ரல்',
    'MAY / மே',
    'JUNE / ஜூன்',
    'JULY /ஜூலை ',
    'AUGUST /ஆகஸ்ட்',
    'SEPTEMBER / செப்டம்பர்',
    'OCTOBER / அக்டோபர்',
    'NOVEMBER / நவம்பர்',
    'DECEMBER / டிசம்பர்'
  ];

  List<String> backgroundImagePaths = [
'assets/sv1.jpg',
'assets/sv2.jpg',
'assets/sv3.jpg',
'assets/sv7.jpg',
'assets/sv5.jpg',
'assets/sv6.jpg',
'assets/sv8.jpg',
'assets/sv9.jpg',
'assets/sv10.jpg',
'assets/sv12.jpg',
'assets/sv13.jpg',
'assets/sv14.jpg',
  ];

  @override
  void initState() {
    super.initState();
  }

  List<bool> isDataGridVisibleList = List.generate(12, (index) => false);
  bool isDataGridVisible = false;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE4F5FF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight +4),
        child: AppBar(
          backgroundColor: Color(0xFF006CA7),
          title: Text('Festivals'),
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
        body: ListView.builder(
            itemCount: 12,
            itemBuilder: (BuildContext context, int index) {
              String monthName = monthNames[index];
              String backgroundImage = backgroundImagePaths[index];
              CustomDataGridWidgetDataSource dataSource =
                  CustomDataGridWidgetDataSource(
                customDataGridWidgetData:
                    getCustomDataGridWidgetDataForMonth(index),
              );
              return Padding(   
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    children: [
                      CustomCard(
                        child: Center(
                          child: AutoSizeText(
                            monthName,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold,color:Colors.white),
                          ),
                        ),
                        backgroundImage: backgroundImage,
                        onTap: () {
                          setState(() {
                            isDataGridVisibleList[index] =
                                !isDataGridVisibleList[index];
                          });
                        },
                      ),
                      Visibility(
                        visible: isDataGridVisibleList[index],
                        child: Container(
                          height: 300,
                          width: double.maxFinite,
                          child: SfDataGrid(
                            source: dataSource,
                            columnWidthMode: ColumnWidthMode.fill,
                            horizontalScrollPhysics: const BouncingScrollPhysics(),
                            columns: <GridColumn>[
                              GridColumn(
                                columnName: 'Date',
                                label: Container(
                                  color: Colors.red,
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: const AutoSizeText('Date'),
                                ),
                              ),
                              GridColumn(
                                columnName: 'Tamil Date',
                                label: Container(
                                  color: Colors.red,
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: const AutoSizeText(' Tamil Date'),
                                ),
                              ),
                              GridColumn(
                                columnName: 'Day',
                                label: Container(
                                  color: Colors.red,
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: const AutoSizeText('Day'),
                                ),
                              ),
                              GridColumn(
                                columnName: 'Festival',
                                label: Container(
                                  color: Colors.red,
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: const AutoSizeText('Festival'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}

class CustomCard extends StatelessWidget {
  final Widget child;
  final String backgroundImage;
  final Function onTap;
  const CustomCard(
      {super.key,
      required this.child,
      required this.backgroundImage,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: SizedBox(
          height: 200,
          width: double.maxFinite,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: Colors.transparent,
            elevation: 5.0,
            shadowColor: const Color(0x3F000000),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(backgroundImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: child,
            ),
          )),
    );
  }
}

//data table

class CustomDataGridWidget {
  CustomDataGridWidget(
    this.tamildate,
    this.date,
    this.day,
    this.Festival,
  );

  final String date;
  final String tamildate;
  final String day;
  final String Festival;
}

class CustomDataGridWidgetDataSource extends DataGridSource {
  CustomDataGridWidgetDataSource(
      {required List<CustomDataGridWidget> customDataGridWidgetData}) {
    _customDataGridWidgetData = customDataGridWidgetData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'Date', value: e.date),
              DataGridCell<String>(columnName: 'Tamil Date', value: e.tamildate),
              DataGridCell<String>(columnName: 'Day', value: e.day),
              DataGridCell<String>(columnName: 'Festival', value: e.Festival),
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
          padding: const EdgeInsets.all(4.0),
          child:AutoSizeText(e.value.toString(),
          style: const TextStyle(fontSize: 12.0),
          ),
        );
      }).toList(),
    );
  }
}

List<CustomDataGridWidget> getCustomDataGridWidgetDataForMonth(int index) {
  switch (index) {
    case 0: //jan//
      return [
        CustomDataGridWidget('மார்கழி 16', '01.01.2024', 'Mon', 'English New Year'.tr),
        CustomDataGridWidget('மார்கழி 19', '04.01.2024', 'Thu', 'Theipirai Astami Bairavar Pooja'.tr),
        CustomDataGridWidget('மார்கழி 24', '09.01.2024', 'Tue', 'krishna Patcha Pradhosam'.tr),
        CustomDataGridWidget('மார்கழி 26', '11.01.2024', 'Thu', 'Hanuman Jeyanthi '.tr),
        CustomDataGridWidget('மார்கழி 26', '11.01.2024', 'Thu', 'Ammavasai'.tr),
      
        CustomDataGridWidget('தை 01', '15.01.2024', 'Mon', 'Thai pongal'.tr),
   
        CustomDataGridWidget('தை 09', '23.01.2024', 'Tue', 'Sukkula Patcha Pradhosam'.tr),
        CustomDataGridWidget('தை 11', '25.01.2024', 'Tue', 'Thaipusam'.tr),
        CustomDataGridWidget('தை 11', '25.01.2024', 'Tue', 'Pournami Pooja'.tr),
      ];
    case 1: //feb//
      return [
        CustomDataGridWidget('தை 19', '02.02.2024', 'Fri', 'Theipirai Astami Bairavar Pooja'.tr),
        CustomDataGridWidget('தை 24', '07.02.2024', 'Wed', 'krishna Patcha Pradhosam'.tr),
        CustomDataGridWidget('தை 26', '09.02.2024', 'Fri', 'Thai Ammavasai'.tr),
        CustomDataGridWidget('மாசி 09', '21.02.2024', 'Wed', 'Sukkula Patcha Pradhosam'.tr),
        CustomDataGridWidget('மாசி 11', '23.02.2024', 'Fri', 'Pournami Pooja'.tr),
        CustomDataGridWidget('மாசி 12', '24.02.2024', 'Sat', 'Masi Maham'.tr),
      ];
      case 2: //mar//
      return [
        CustomDataGridWidget('மாசி 20', '03.03.2024', 'Sun', 'Theipirai Astami Bairavar Pooja'.tr),
        CustomDataGridWidget('மாசி 25', '08.03.2024', 'Fri', 'Maha Shivaratri'.tr),
        CustomDataGridWidget('மாசி 25', '08.03.2024', 'Fri', 'krishna Patcha Pradhosam'.tr),
        CustomDataGridWidget('மாசி 27', '10.03.2024', 'Sun', 'Ammavasai'.tr),
        CustomDataGridWidget('பங்குனி 09', '22.03.2024', 'Fri', 'Sukkula Patcha Pradhosam'.tr),
        //CustomDataGridWidget('பங்குனி 11', '24.03.2024', 'Sun', 'Holi'),
        //CustomDataGridWidget('பங்குனி 12', '25.03.2024', 'Mon', 'Panguni Uthiram'),
      ];
      case 3: //apr//
      return [
        CustomDataGridWidget('பங்குனி 19', '01.04.2024', 'Mon', 'Theipirai Astami Bairavar Pooja'.tr),
        CustomDataGridWidget('பங்குனி 24', '06.04.2024', 'Thu', 'krishna Patcha Pradhosam'.tr),
        CustomDataGridWidget('பங்குனி 26', '08.04.2024', 'Mon', 'Ammavasai'.tr),
        // CustomDataGridWidget('பங்குனி 27', '09.04.2024', 'Thu', 'Ugadi'.tr),
        // CustomDataGridWidget('சித்திரை 1', '14.04.2024', 'Sun', 'Tamil Puthandu'.tr),
        // CustomDataGridWidget('சித்திரை 10', '23.04.2024', 'Thu', 'Chitra Pournami'.tr),
      ];
      case 4: //may//
      return [
        // CustomDataGridWidget('சித்திரை 21', '04.05.2024', 'Sat', 'Agni Natchathiram Aarambam'),
        // CustomDataGridWidget('சித்திரை 27', '10.05.2024', 'Fri', 'Akshaya Tritiya'),
        // CustomDataGridWidget('வைகாசி 09', '22.05.2024', 'Wed', 'Vaikasi Visakam'),
        // CustomDataGridWidget('வைகாசி 15', '28.05.2024', 'Tue', 'Agni Natchathiram Nivarthi'),
      ];
      case 5: //jun// no festival
      return [
        // CustomDataGridWidget('தை 26', '09.02.2024', 'Fri', 'Hanuman Jeyanthi'),
        // CustomDataGridWidget('மாசி 12', '24.02.2024', 'Sat', 'Hanuman Jeyanthi'),
      ];
      case 6: //jul//
      return [
        // CustomDataGridWidget('ஆனி 28', '12.07.2024', 'Fri', 'Aani Thirumanjanam'),
        // CustomDataGridWidget('ஆடி 05', '21.07.2024', 'S', 'Aadi Thapasu '),
      ];
      case 7: //aug//
      return [
        // CustomDataGridWidget('தை 26', '03.08.2024', 'Fri', 'Hanuman Jeyanthi'),
        // CustomDataGridWidget('மாசி 12', '24.02.2024', 'Sat', 'Hanuman Jeyanthi'),
        // CustomDataGridWidget('மாசி 12', '24.02.2024', 'Sat', 'Hanuman Jeyanthi'),
        // CustomDataGridWidget('மாசி 12', '24.02.2024', 'Sat', 'Hanuman Jeyanthi'),
        // CustomDataGridWidget('மாசி 12', '24.02.2024', 'Sat', 'Hanuman Jeyanthi'),
        // CustomDataGridWidget('மாசி 12', '24.02.2024', 'Sat', 'Hanuman Jeyanthi'),
        // CustomDataGridWidget('மாசி 12', '24.02.2024', 'Sat', 'Hanuman Jeyanthi'),
        // CustomDataGridWidget('மாசி 12', '24.02.2024', 'Sat', 'Hanuman Jeyanthi'),
        // CustomDataGridWidget('மாசி 12', '24.02.2024', 'Sat', 'Hanuman Jeyanthi'),
      ];
      case 8: //sep//
      return [
        // CustomDataGridWidget('தை 26', '09.02.2024', 'Fri', 'Hanuman Jeyanthi'),
        // CustomDataGridWidget('மாசி 12', '24.02.2024', 'Sat', 'Hanuman Jeyanthi'),
      ];
      case 9: //oct//
      return [
        // CustomDataGridWidget('தை 26', '09.02.2024', 'Fri', 'Hanuman Jeyanthi'),
        // CustomDataGridWidget('மாசி 12', '24.02.2024', 'Sat', 'Hanuman Jeyanthi'),
      ];
      case 10: //Nov//
      return [
        // CustomDataGridWidget('தை 26', '09.02.2024', 'Fri', 'Hanuman Jeyanthi'),
        // CustomDataGridWidget('மாசி 12', '24.02.2024', 'Sat', 'Hanuman Jeyanthi'),
      ];
      case 11: //dec//
      return [
        // CustomDataGridWidget('தை 26', '09.02.2024', 'Fri', 'Hanuman Jeyanthi'),
        // CustomDataGridWidget('மாசி 12', '24.02.2024', 'Sat', 'Hanuman Jeyanthi'),
      ];

    default:
      return [];
  }
}
