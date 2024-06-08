// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/gen/assets.gen.dart';

enum RowIcons { pencil, microphone }

// ignore: must_be_immutable
class RowIconTitle extends StatelessWidget {
  RowIconTitle({
    super.key,
    this.sidePaddings = 0,
    required this.title,
    this.rowIcon = RowIcons.pencil,
  });

  final double sidePaddings;
  final String title;
  RowIcons? rowIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: sidePaddings),
      child: Row(
        children: [
          ImageIcon(
            rowIcon == RowIcons.pencil
                ? Assets.icons.pencil.image().image
                : Assets.icons.microphone.image().image,
            color: SolidColors.showSectionTitle,
          ),
          SizedBox(width: Get.width / 32.18),
          Text(
            title,
            style: Get.textTheme.headline3,
          ),
        ],
      ),
    );
  }
}
