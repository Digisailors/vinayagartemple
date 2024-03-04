import 'package:flutter/material.dart';
import 'package:sreeselvavinayagartemple/themes/color_schemes.g.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';

void showIncompleteProfileBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            hGap10,
            Text(
              'Complete your profile',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: 60,
                    width: 60,
                    //color: Colors.amber,
                    child: Image.asset(
                      "assets/warning_icon.png",
                      fit: BoxFit.fill,
                    )),
                Container(
                  height: 60,
                  width: 230,
                  //color: const Color.fromARGB(255, 0, 0, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Please provide mandatory information in profile',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
            hGap5,
            TextButton(
              onPressed: () {
                // Handle the "Complete Profile" button action
                // You can navigate to the profile page or any other page
                Navigator.pop(context); // Close the bottom sheet
                // Navigator.pushNamed(context,
                //     '/profile'); // Replace '/profile' with your profile page route
              },
              child: Text(
                'Complete Profile',
                style: TextStyle(color: lightColorScheme.primary),
              ),
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: lightColorScheme.primary),
                onPressed: () {
                  // Handle the "OK" button action
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ),
            hGap5
          ],
        ),
      );
    },
  );
}
