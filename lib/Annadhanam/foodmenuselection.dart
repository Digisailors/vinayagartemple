import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sreeselvavinayagartemple/Annadhanam/annathanam_date_selection.dart';
import 'package:sreeselvavinayagartemple/eghlflutter.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';

class FoodmenuSelection extends StatefulWidget {
  const FoodmenuSelection({super.key});

  @override
  State<FoodmenuSelection> createState() => _FoodmenuSelectionState();
}

class _FoodmenuSelectionState extends State<FoodmenuSelection> {
    String _eghlPaymentResult = 'Awaiting for payment.';
  String selectedMealType = 'Breakfast';
  int? selectedRadioValue = 1;
  int? selectedDropdownValue;

  List<String> menuItems = [
    'Idly + Sambar + Chutney + Coffee',
    'Idiyappam + Sambar + Chutney + Coffee',
    'Idiyappam + Sambar + Chutney + Coffee',
  ];
  List<String> menuItemslunch = [
    'Rice+Sambar+2vegetables+Appalam+Payasam+Mineralwater(cup)',
    'Rice+Sambar+3vegetables+Appalam+Payasam+Mineralwater(cup)',
    'Rice+Sambar+4vegetables+Appalam+Payasam+Mineralwater(cup)',
  ];
  List<String> menuItemsDinner = [
    'Rice+Sambar+2vegetables+Appalam+Payasam+Mineralwater(cup)',
    'Rice+Sambar+4vegetables+Appalam+Payasam+Mineralwater(cup)',
    'Rice+Sambar+2vegetables+Appalam+Payasam+Mineralwater(cup)',
  ];
  List<int> dropdownValues = [100, 150, 200, 250, 300, 400, 500];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const AutoSizeText('Annathanam'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              title: const Text('CHOOSE YOUR MENU'),
              children: [
                ListTile(
                  title: const Text('Breakfast'),
                  onTap: () {
                    setState(() {
                      selectedMealType = 'Breakfast';
                    });
                  },
                ),
                ListTile(
                  title: const Text('Lunch'),
                  onTap: () {
                    setState(() {
                      selectedMealType = 'Lunch';
                    });
                  },
                ),
                ListTile(
                  title: const AutoSizeText('Dinner'),
                  onTap: () {
                    setState(() {
                      selectedMealType = 'Dinner';
                    });
                  },
                ),
              ],
            ),
            if (selectedMealType == 'Breakfast')
              Card(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      hGap10,
                      ListTile(
                        leading: const AutoSizeText('Package'),
                        trailing: SizedBox(
                          height: 60,
                          width: 110,
                          child: DropdownButtonFormField<int>(
                            value: selectedDropdownValue,
                            items: dropdownValues.map((value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text(value.toString()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedDropdownValue = value;
                              });
                            },
                            // decoration: InputDecoration(
                            //   border: OutlineInputBorder(),
                            //   labelText: 'Package',
                            // ),
                          ),
                        ),
                      ),
                      hGap10,
                      const SizedBox(
                        width: 345,
                        child: AutoSizeText(
                          'Minimum 100 px',
                          textAlign: TextAlign.right,
                        ),
                      ),
                      hGap10,
                      Container(
                        height: 200,
                        child: ListView.builder(
                          itemCount: menuItems.length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              elevation: 5,
                              child: ListTile(
                                title: AutoSizeText(menuItems[index]),
                                subtitle: const Text('RM 5.00'),
                                trailing: Radio(
                                  value: index,
                                  groupValue: selectedRadioValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedRadioValue = value;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      hGap10,
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Add On per pax',
                            style: hb14,
                          )),
                      hGap10,
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              elevation: 5,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 30,
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/idly.jpg',
                                      width: 45,
                                      height: 45,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5),
                                    AutoSizeText(
                                      'Vada',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w300),
                                    ),
                                    AutoSizeText(
                                      '1 Pc',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w300),
                                    ),
                                    AutoSizeText(
                                      'RM 5',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                                trailing: Radio(
                                  value: index,
                                  groupValue: selectedRadioValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedRadioValue = value;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (selectedMealType == 'Lunch')
              Card(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      hGap10,
                      ListTile(
                        leading: const AutoSizeText('Lunch Package'),
                        trailing: SizedBox(
                          height: 60,
                          width: 110,
                          child: DropdownButtonFormField<int>(
                            value: selectedDropdownValue,
                            items: dropdownValues.map((value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text(value.toString()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedDropdownValue = value;
                              });
                            },
                            // decoration: InputDecoration(
                            //   border: OutlineInputBorder(),
                            //   labelText: 'Package',
                            // ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 345,
                        child: AutoSizeText(
                          'Minimum 100 px',
                          textAlign: TextAlign.right,
                        ),
                      ),
                      hGap10,
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: menuItemslunch.length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              elevation: 5,
                              child: ListTile(
                                title: AutoSizeText(menuItems[index]),
                                subtitle: const Row(
                                  children: [
                                    AutoSizeText('RM 6.50'),
                                    wGap15,
                                    AutoSizeText('white Rice')
                                  ],
                                ),
                                trailing: Radio(
                                  value: index,
                                  groupValue: selectedRadioValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedRadioValue = value;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (selectedMealType == 'Dinner')
              SingleChildScrollView(
                child: Column(
                  children: [
                    hGap10,
                    ListTile(
                      leading: const Text('Dinner Package'),
                      trailing: SizedBox(
                        height: 60,
                        width: 110,
                        child: DropdownButtonFormField<int>(
                          value: selectedDropdownValue,
                          items: dropdownValues.map((value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: AutoSizeText(value.toString()),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedDropdownValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 250,
                      child: AutoSizeText(
                        'Minimum 100 px',
                        textAlign: TextAlign.right,
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: menuItemslunch.length,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 5,
                            child: ListTile(
                              title: Text(menuItems[index]),
                              subtitle: const Row(
                                children: [
                                  AutoSizeText('RM 6.50'),
                                  wGap15,
                                  AutoSizeText('white Rice')
                                ],
                              ),
                              trailing: Radio(
                                value: index,
                                groupValue: selectedRadioValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedRadioValue = value;
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    hGap10,
                  ],
                ),
              ),
            hGap20,
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AutoSizeText(
                            'Total:',
                            style: hb14,
                          ),
                          AutoSizeText(
                            '\RM 23',
                            style: normalText.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      hGap10,
                      CustomElevatedButton(
                        onPressed: () {
                            _Pay(context);
                        },
                        buttonText: 'Pay now',
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
   // ignore: non_constant_identifier_names
  void _Pay(BuildContext context) async {
    String result = '';
    String paymentId = 'SIT${new DateTime.now().millisecondsSinceEpoch}';

    try {
      Map<String, dynamic> payment = {
        'TransactionType': 'SALE',
        'Amount': '1.00',
        'CurrencyCode': 'MYR',
        'PaymentId': paymentId,
        'OrderNumber': paymentId,
        'PaymentDesc': 'Testing Payment',
        'PymtMethod': 'ANY',
        'CustName': 'somebody',
        'CustEmail': 'somebody@someone.com',
        'CustPhone': '0123456789',
        'MerchantReturnURL': 'SDK',
        'MerchantCallBackURL': 'SDK',
        'ServiceId': 'SIT',
        'Password': 'sit12345',
        'LanguageCode': 'EN',
        'PageTimeout': '600',
        'PaymentGateway': true,
        'EnableCardPage': false,
        'TriggerReturnURL': false,
        'NumOfRequery': 1,
      };

      result = await Eghlflutter.executePayment(payment);
    } catch (e) {
      // result = e.message;
    }

    setState(() {
      _eghlPaymentResult = result;
    });
  }
}
