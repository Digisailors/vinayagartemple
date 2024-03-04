import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';

class HorizontalCouponExample1 extends StatefulWidget {
  const HorizontalCouponExample1({Key? key}) : super(key: key);

  @override
  State<HorizontalCouponExample1> createState() => _HorizontalCouponExample1State();
}

class _HorizontalCouponExample1State extends State<HorizontalCouponExample1> {
  Color primaryColor = Color.fromARGB(255, 243, 218, 203);
 Color secondaryColor = Color.fromARGB(255, 81, 143, 54);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CouponCard(
        height: 500,
        backgroundColor: primaryColor,
        curveAxis: Axis.horizontal,
        firstChild: Container(
          decoration: BoxDecoration(
            color: secondaryColor,
          ),
          child:
           Image.asset(
                  'assets/deepam.jpg',
                  fit: BoxFit.fitWidth, 
                ),  
        ),
        secondChild: Container(
          width: double.maxFinite,
          padding:  EdgeInsets.all(18),
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text('Name')),
                  Expanded(
                    flex: 2,
                    child: Text('Name'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
