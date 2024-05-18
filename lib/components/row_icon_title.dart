import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class RowIconTitle extends StatelessWidget {
  const RowIconTitle({
    super.key,
    this.sidePaddings = 0,
    required this.title,
  });

  final double sidePaddings;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: sidePaddings),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.pencil.image().image,
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
