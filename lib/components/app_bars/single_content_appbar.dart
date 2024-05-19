import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constants/colors.dart';

AppBar singleContentAppBar() {
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
    actions: [
      const Icon(
        Icons.bookmark_border_outlined,
        color: SolidColors.icon,
      ),
      SizedBox(width: Get.width / 36),
      const Icon(
        Icons.share,
        color: SolidColors.icon,
      ),
      SizedBox(width: Get.width / 26.35),
    ],
  );
}
