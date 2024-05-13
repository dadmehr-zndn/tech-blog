//TODO: uncomment
// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/binding.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:flutter/services.dart';
import 'package:tech_blog/views/splash_screen.dart';
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
      initialBinding: ArticleBinding(),
      title: 'Tech Blog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            color: SolidColors.posterTitle,
            fontFamily: 'ArtinSharp',
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          subtitle1: TextStyle(
            color: SolidColors.posterSubTitle,
            fontFamily: 'ArtinSharp',
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
          headline2: TextStyle(
            color: SolidColors.tagsTitle,
            fontFamily: 'ArtinSharp',
            fontSize: 14,
            fontWeight: FontWeight.w200,
          ),
          headline3: TextStyle(
            color: SolidColors.showSectionTitle,
            fontFamily: 'ArtinSharp',
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          headline4: TextStyle(
            color: SolidColors.profileTexts,
            fontFamily: 'ArtinSharp',
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodyText1: TextStyle(
            color: SolidColors.registerScreenText,
            fontFamily: 'ArtinSharp',
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          subtitle2: TextStyle(
            color: SolidColors.textHint,
            fontFamily: 'ArtinSharp',
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          button: TextStyle(
            color: SolidColors.buttonTextColor,
            fontFamily: 'ArtinSharp',
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.pressed)) {
                  return SolidColors.primaryColor.withOpacity(0.7);
                }
                return SolidColors.primaryColor;
              },
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                //TODO: exact Radius
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: textTheme.subtitle2,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: SolidColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(
              color: SolidColors.border,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(
              color: SolidColors.primaryColor,
              width: 2,
            ),
          ),
        ),
      ),
      locale: Locale('fa'),
      //TODO: change it back to splash
      home: SplashScreen(),
    );
  }
}
