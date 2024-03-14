import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sreeselvavinayagartemple/homeScreen/homepage.dart';

import 'package:sreeselvavinayagartemple/languagetranslation.dart';
import 'package:sreeselvavinayagartemple/themes/color_schemes.g.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: false, colorScheme: lightColorScheme.copyWith(primary: Colors.white)),
      darkTheme: ThemeData(useMaterial3:false, colorScheme: darkColorScheme.copyWith(primary: Colors.red)),
      home:Homepage(),
       translations: WorldLanguage(),
      locale:
          const Locale('ms', 'MS'),
      fallbackLocale: const Locale('ms',
          'MS'),
    );
  }
}