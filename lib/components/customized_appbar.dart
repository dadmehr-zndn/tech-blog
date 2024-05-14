// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tech_blog/constants/colors.dart';
import 'package:tech_blog/themes/text_styles.dart';

PreferredSize customizedAppBar(Size size, {required String title}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(size.height / 8.5),
    child: Padding(
      padding: EdgeInsets.only(top: size.height / 37.05),
      child: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: Padding(
          padding: EdgeInsets.fromLTRB(
            size.width / 9.67,
            0,
            size.width / 19.39,
            0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: SolidColors.backButton,
                radius: 25,
                child: Icon(
                  Icons.arrow_back,
                  color: SolidColors.icon,
                ),
              ),
              Text(
                title,
                style: appBarTextStyle,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
