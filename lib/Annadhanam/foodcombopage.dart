// import 'package:flutter/material.dart';
// import 'package:sreeselvavinayagartemple/Annadhanam/annathanam_date_selection.dart';
// import 'package:sreeselvavinayagartemple/themes/font_height.dart';

// class FoodComboSelectionPage extends StatefulWidget {
//   const FoodComboSelectionPage({super.key});

//   @override
//   State<FoodComboSelectionPage> createState() => _FoodComboSelectionPageState();
// }

// class _FoodComboSelectionPageState extends State<FoodComboSelectionPage> {
//   int? selectedDropdownValue;
//   int? selectedRadioValue;
//   List<String> menuItems = [
//     'Idly+Sambar+Chutney+Coffee',
//     'Idiyappam+Sambar+Chutney+Coffee',
//     'Idiyappam+Sambar+Chutney+Coffee',
//   ];
//   List<int> dropdownValues = [100, 150, 200, 250, 300, 400, 500];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.red,
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 ListTile(leading:Text('Breakfast Package'),
//                 trailing: 
//                       Container(
//                         width: 40,
//                         height: 20,
//                         child: DropdownButtonFormField<int>(
//                           value: selectedDropdownValue,
//                           items: dropdownValues.map((value) {
//                             return DropdownMenuItem<int>(
//                               value: value,
//                               child: Text(value.toString()),
//                             );
//                           }).toList(),
//                           onChanged: (value) {
//                             setState(() {
//                               selectedDropdownValue = value;
//                             });
//                           },
//                           // decoration: InputDecoration(
//                           //   border: OutlineInputBorder(),
//                           //   labelText: 'Package',
//                           // ),
//                         ),
//                       ),),
              
//                 Container(
//                   width: 250,
//                   child: Text(
//                     'Minimum 100 px',
//                     textAlign: TextAlign.right,
//                   ),
//                 ),
//                 Container(
//                   height: 200,
//                   child: ListView.builder(
//                     itemCount: menuItems.length,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         elevation: 5,
//                         child: ListTile(
//                           title: Text(menuItems[index]),
//                           subtitle: Text('RM 5.00'),
//                           trailing: Radio(
//                             value: index,
//                             groupValue: selectedRadioValue,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedRadioValue = value as int?;
//                               });
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 hGap10,
//                 Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Text(
//                       'Add On per pax',
//                       style: hb2,
//                     )),
//                 hGap10,
//                 Container(
//                   height: 240,
//                   child: ListView.builder(
//                     itemCount: 3,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         elevation: 5,
//                         child: ListTile(
//                           leading: CircleAvatar(
//                             backgroundColor: Colors.white,
//                             radius: 30,
//                             child: ClipOval(
//                               child: Image.asset(
//                                 'assets/idly.jpg',
//                                 width: 60,
//                                 height: 60,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           title: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(height: 5),
//                               Text('Vada', style: hb14),
//                               Text('1 Pc', style: hb14),
//                               Text('RM 5', style: hb14),
//                             ],
//                           ),
//                           trailing: Radio(
//                             value: index,
//                             groupValue: selectedRadioValue,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedRadioValue = value as int?;
//                               });
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 hGap20,
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Text(
//                                 'Total:',
//                                 style: hb14,
//                               ),
//                               Text(
//                                 '\RM 23',
//                                 style: normalText.copyWith(
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           hGap10,
//                           CustomElevatedButton(
//                             onPressed: () {},
//                             buttonText: 'Pay now',
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
