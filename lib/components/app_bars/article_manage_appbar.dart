import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constants/constants.dart';

AppBar articleManageAppBar() {
  return AppBar(
    toolbarHeight: Get.height / 16,
    backgroundColor: Colors.transparent,
    leading: Padding(
      padding: EdgeInsets.only(right: Get.width / 50),
      child: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back,
          color: SolidColors.icon,
        ),
      ),
    ),
  );
}
