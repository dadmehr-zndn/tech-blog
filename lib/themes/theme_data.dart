// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:tech_blog/constants/constants.dart';

ThemeData lightThemeData(TextTheme textTheme) {
  return ThemeData(
    textTheme: TextTheme(
      headline1: const TextStyle(
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
      headline2: const TextStyle(
        color: SolidColors.tagsTitle,
        fontFamily: 'ArtinSharp',
        fontSize: 14,
        fontWeight: FontWeight.w200,
      ),
      headline3: const TextStyle(
        color: SolidColors.showSectionTitle,
        fontFamily: 'ArtinSharp',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      headline4: const TextStyle(
        color: SolidColors.profileTexts,
        fontFamily: 'ArtinSharp',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyText1: const TextStyle(
        color: SolidColors.registerScreenText,
        fontFamily: 'ArtinSharp',
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      subtitle2: const TextStyle(
        color: SolidColors.textHint,
        fontFamily: 'ArtinSharp',
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      button: const TextStyle(
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
        borderSide: const BorderSide(color: SolidColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
        borderSide: const BorderSide(
          color: SolidColors.border,
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
        borderSide: const BorderSide(
          color: SolidColors.primaryColor,
          width: 2,
        ),
      ),
    ),
  );
}
