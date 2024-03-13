import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sreeselvavinayagartemple/Authentication/landing.dart';
import 'package:sreeselvavinayagartemple/languagetranslation.dart';
import 'package:sreeselvavinayagartemple/themes/color_schemes.g.dart';

class SessionHandler extends StatelessWidget {
  const SessionHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: lightColorScheme.copyWith(primary: Colors.black),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: false,
        colorScheme: darkColorScheme.copyWith(primary: Colors.red),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      home: LandingPage (),
      translations: WorldLanguage(),
      locale: const Locale('ms', 'MS'),
      fallbackLocale: const Locale('ms', 'MS'),
    );
  }
}
