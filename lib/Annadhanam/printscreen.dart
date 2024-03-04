import 'dart:io';
import 'dart:typed_data';
import 'package:screenshot/screenshot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sreeselvavinayagartemple/aa_controller/session_Controller.dart';
import 'package:sreeselvavinayagartemple/aa_model/paymentmodel.dart';
import 'package:sreeselvavinayagartemple/homeScreen/homepage.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:open_file/open_file.dart' as open_file;
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart' as path_provider;

class PrintScreenpage extends StatefulWidget {
  final AnnathanamDetails annathanamDetails;
  final TempDetail tempDetail;

  const PrintScreenpage(
      {Key? key, required this.annathanamDetails, required this.tempDetail})
      : super(key: key);

  @override
  State<PrintScreenpage> createState() => _PrintScreenpageState();
}

class _PrintScreenpageState extends State<PrintScreenpage> {
  SessionController? controller;
  ScreenshotController screenshotController = ScreenshotController();

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(title),
          );
        },
      ),
    );

    return pdf.save();
  }

  @override
  void initState() {
    super.initState();
    controller = Get.put(SessionController());
  }

  @override
  Widget build(BuildContext context) {
    print(widget.annathanamDetails.amount);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Booking Items'),
        actions: [
          IconButton(onPressed:()async{
            await Get.to(()=>Homepage());
          }, icon: Icon(Icons.exit_to_app)),
          IconButton(
            icon: Icon(Icons.download_rounded),
            onPressed: () async {
              await screenshotController.capture(pixelRatio: 1.5).then(
                    (value) => {saveAndLaunchFile(value!, 'example.jpg')});
            },
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          return Center(
            child: Screenshot(
              controller: screenshotController,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.network(widget.tempDetail.image ?? ''),
                      ),
                      title: Text(widget.tempDetail.name ?? ''),
                      subtitle: Column(
                        children: [
                          Text(widget.tempDetail.address1 ?? ''),
                          Row(
                            children: [
                              Text(
                                  'Post Code :${widget.tempDetail.postcode ?? ''}'),
                              wGap5,
                              Text('Mobile :${widget.tempDetail.telephone ?? ''}')
                            ],
                          ),
                        ],
                      ),
                    ),
                    hGap15,
                    Row(
                      children: [
                        Expanded(flex: 1, child: Text('Name :')),
                        Expanded(
                            flex: 2,
                            child:
                                Text(widget.annathanamDetails.name ?? '')),
                      ],
                    ),
                    hGap20,
                    Row(
                      children: [
                        Expanded(flex: 1, child: Text('Date :')),
                        Expanded(
                            flex: 2,
                            child: Text(widget.annathanamDetails.date
                                .toString())),
                      ],
                    ),
                    hGap20,
                    Row(
                      children: [
                        Expanded(flex: 1, child: Text('Slot time :')),
                        Expanded(
                            flex: 2,
                            child: Text(widget.annathanamDetails.slotTime
                                .toString())),
                      ],
                    ),
                    hGap20,
                    Row(
                      children: [
                        Expanded(flex: 1, child: Text('Rice Type :')),
                        Expanded(
                            flex: 2,
                            child: Text(widget.annathanamDetails.riceTypeName
                                .toString())),
                      ],
                    ),
                    hGap20,
                    Row(
                      children: [
                        Expanded(flex: 1, child: Text('Kuruma Type :')),
                        Expanded(
                            flex: 2,
                            child: Text(widget.annathanamDetails.kurumaName
                                .toString())),
                      ],
                    ),
                    hGap20,
                    Row(
                      children: [
                        Expanded(flex: 1, child: Text('NO of pax :')),
                        Expanded(
                            flex: 2,
                            child: Text(widget.annathanamDetails.noOfPax
                                .toString())),
                      ],
                    ),
                    hGap20,
                    Row(
                      children: [
                        Expanded(flex: 1, child: Text('Amount :')),
                        Expanded(
                            flex: 2,
                            child: Text(widget.annathanamDetails.amount
                                .toString())),
                      ],
                    ),
                    hGap20,
                    Row(
                      children: [
                        Expanded(flex: 1, child: Text(' Total Amount :')),
                        Expanded(
                            flex: 2,
                            child: Text(widget.annathanamDetails.totalAmount
                                .toString())),
                      ], 
                    ),
                    hGap20,
                    
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<Uint8List> generatePdf(Uint8List image) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        orientation: pw.PageOrientation.landscape,
        build: (context) {
          return pw.Column(
            children: [
              pw.SizedBox(
                width: double.infinity,
                child: pw.FittedBox(
                  child: pw.Image(pw.MemoryImage(image)),
                ),
              ),
            ],
          );
        },
      ),
    );
    final file = File("example.pdf");
    await file.writeAsBytes(await pdf.save());
    return pdf.save();
  }
}

Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
  String? path;
  if (Platform.isAndroid || Platform.isIOS || Platform.isLinux || Platform.isWindows) {
    final Directory directory = await path_provider.getApplicationSupportDirectory();
    path = directory.path;
  } else {
    path = await path_provider.PathProviderPlatform.instance.getApplicationSupportPath();
  }
  final File file = File(Platform.isWindows ? '$path\\$fileName' : '$path/$fileName');
  await file.writeAsBytes(bytes, flush: true);
  if (Platform.isAndroid || Platform.isIOS) {
    await open_file.OpenFile.open('$path/$fileName');
  } else if (Platform.isWindows) {
    await Process.run('start', <String>['$path\\$fileName'], runInShell: true);
  } else if (Platform.isMacOS) {
    await Process.run('open', <String>['$path/$fileName'], runInShell: true);
  } else if (Platform.isLinux) {
    await Process.run('xdg-open', <String>['$path/$fileName'], runInShell: true);
  }
}
