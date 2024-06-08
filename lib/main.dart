//TODO: uncomment
// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/binding.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:flutter/services.dart';
import 'package:tech_blog/routes/app_pages.dart';
import 'package:tech_blog/themes/theme_data.dart';
// import 'gen/fonts.gen.dart';
// import 'gen/assets.gen.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: SolidColors.systemStatusBar,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: SolidColors.systemNavigationBar,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GetMaterialApp(
      title: 'Tech Blog',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: Routes.initialRoute,
      initialBinding: HomeBinding(),
      theme: lightThemeData(textTheme),
      locale: Locale('fa'),
    );
  }
}
