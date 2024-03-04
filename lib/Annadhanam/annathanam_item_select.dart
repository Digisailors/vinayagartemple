import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';

class AnnathanamMenuSelectionPage extends StatefulWidget {
  const AnnathanamMenuSelectionPage({super.key});

  @override
  State<AnnathanamMenuSelectionPage> createState() => _AnnathanamMenuSelectionPageState();
}

class _AnnathanamMenuSelectionPageState extends State<AnnathanamMenuSelectionPage> {
   int unitCount = 0;
  @override
  Widget build(BuildContext context) {
     var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
       Card(
        child:Container(
          child: Column(
            children: [
              Card(
                child:ListTile( leading:AutoSizeText('Idly(2)+sambar+chunteny+coffee')
                // ,trailing: Container(child: Row(
                //   children: [
                //     Text('RM 5.00'),

                //   ],
                // ),
                // ),
                ),
              )
            ],
          ),
          height: 200,
          width: mediaQuery.width,
        ),
       ),

            Expanded(
              child: ListView(
                children: [
                  CartItem(
                    mediaQuery: mediaQuery,
                    itemName: 'Idly',
                    price: '12',
               image: 'idly.jpg',
                  unit: unitCount,
                  onTap: (){
                     setState(() {
                    unitCount++;
                  });
                  },
                  onTapremove: (){
                     if (unitCount > 0) {
                    setState(() {
                      unitCount--;
                    });
                  }
                  },

                  ),
                  CartItem(
                    mediaQuery: mediaQuery,
                    itemName: 'Vadai',
                    price: '10',
                    image: 'vada.jpg',
                    unit: unitCount, onTap: (){},
                      onTapremove: (){},
                  ),
                  CartItem(
                    mediaQuery: mediaQuery,
                    itemName: 'Keasari',
                    price: '5',
                    image: 'kaesari.jpg',
                       unit: unitCount, onTap: (){},
                         onTapremove: (){},


                  ),

                   CartItem(

                    mediaQuery: mediaQuery,
                    itemName: 'Coffee',
                    price: '12',
                    image: 'coffee.jpg',
                       unit:unitCount ,
                        onTap: (){},
                onTapremove: (){},
                  ),
                ],
              ),
            ),
            /* <----------- End Of products ------------> */

            /* <----------- Total Price ------------> */
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: BoxDecoration(
                color: thirdColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(leading: const Text('Selected Items', style: h2),trailing:Text('3', style: h2) ,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AutoSizeText(
                        'Total:',
                        style: lessImportantText,
                      ),
                      Text(
                        '\RM 23',
                        style: normalText.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            /* <----------- End of Total Price ------------> */

            /* <----------- Payment button ------------> */
            InkWell(
              onTap: () {

              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    wGap10,
                    AutoSizeText(
                      'Proceed To Payment',
                      style: h1.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            /* <----------- End of Payment Button ------------> */
          ],
        )),
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  const CartItem(
      {Key? key,
      required this.mediaQuery,
      required this.onTap,
        required this.onTapremove,

      this.itemName,

      this.price,
      this.image,
      required this.unit})
      : super(key: key);
final Function  onTap;
final Function onTapremove;
  final Size mediaQuery;
  final String? itemName, price, image;
  final int unit;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
  return Container(
  margin: const EdgeInsets.symmetric(vertical: 10),
  child: ListTile(
    leading: Container(
      width: widget.mediaQuery.width * 0.15,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,

        child: ClipOval(

          child: Image.asset(
            'assets/${widget.image}',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    ),
        title: AutoSizeText(
          '${widget.itemName}',
          style: hb3.copyWith(fontWeight: FontWeight.normal),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              '\RM ${widget.price}',
              style: normalText.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        trailing: Container(
          width: widget.mediaQuery.width * 0.3,
          child: Row(
            children: [
              GestureDetector(
                onTap:(){
                  widget.onTap();
                } ,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: thirdColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: primaryColor,
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: widget.mediaQuery.width * 0.02),
                child: AutoSizeText(
                  '${widget.unit}',
                  style: normalText,
                ),
              ),
              GestureDetector(
                onTap: () {
                 widget.onTapremove();
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: thirdColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        /* <----------- End of Counter ------------> */
      ),
    );
  }
}