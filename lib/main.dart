//todo: uncomment
// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/constants.dart';
import 'package:tech_blog/main_screen.dart';
import 'package:flutter/services.dart';
import 'package:tech_blog/splash_screen.dart';
// import 'gen/fonts.gen.dart';
// import 'gen/assets.gen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: SolidColors.systemStatusBar,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: SolidColors.systemNavigationBar,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Blog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            color: SolidColors.posterTitle,
            fontFamily: 'ArtinSharp',
            fontSize: 25,
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
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // English
      ],

      //todo: change it back to splash
      home: SplashScreen(),
    );
  }
}
