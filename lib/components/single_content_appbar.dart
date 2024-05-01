import 'package:flutter/material.dart';
import 'package:tech_blog/constants/colors.dart';

AppBar singleContentAppBar(Size size) {
  return AppBar(
    toolbarHeight: size.height / 16,
    backgroundColor: Colors.transparent,
    leading: Padding(
      padding: EdgeInsets.only(right: size.width / 50),
      child: const Icon(
        Icons.arrow_back,
        color: SolidColors.icon,
      ),
    ),
    actions: [
      const Icon(
        Icons.bookmark_border_outlined,
        color: SolidColors.icon,
      ),
      SizedBox(width: size.width / 36),
      const Icon(
        Icons.share,
        color: SolidColors.icon,
      ),
      SizedBox(width: size.width / 26.35),
    ],
  );
}
