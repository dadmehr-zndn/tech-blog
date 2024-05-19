// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/controllers/home_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class Hashtag extends StatelessWidget {
  Hashtag({
    super.key,
    required this.size,
    required this.textTheme,
    required this.index,
    this.isArticleManaging = false,
  });

  final Size size;
  final TextTheme textTheme;
  final int index;
  bool? isArticleManaging;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //TODO: look for the exact radius
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: GradientColors.tags,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          right: size.width / 34.97,
          left: size.width / 18,
        ),
        child: SizedBox(
          height: isArticleManaging! ? Get.height / 20 : 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //hastag icon
              ImageIcon(
                Assets.icons.hastag.image().image,
                color: SolidColors.icon,
                size: size.width / 30,
              ),
              SizedBox(width: size.width / 22),

              // hashtag title
              Text(
                Get.find<HomeScreenController>().tagsList[index].title!,
                style: textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
