// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constants/colors.dart';
import 'package:tech_blog/themes/text_styles.dart';

PreferredSize customizedAppBar({required String title}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(Get.height / 10),
    child: Padding(
      padding: EdgeInsets.only(top: Get.height / 37.05),
      child: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: Padding(
          padding: EdgeInsets.fromLTRB(
            Get.width / 9.67,
            0,
            Get.width / 19.39,
            0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: CircleAvatar(
                  backgroundColor: SolidColors.backButton,
                  radius: 23,
                  child: Icon(
                    Icons.arrow_back,
                    color: SolidColors.icon,
                  ),
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
