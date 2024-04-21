// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tech_blog/constants.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';

class Hashtag extends StatelessWidget {
  const Hashtag({
    super.key,
    required this.size,
    required this.textTheme,
    required this.index,
  });

  final Size size;
  final TextTheme textTheme;
  final int index;

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
          left: size.width / 13.65,
        ),
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
              hashTagsList[index].title,
              style: textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }
}
