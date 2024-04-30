//TODO: uncomment
// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tech_blog/components/profile_divider.dart';
import 'package:tech_blog/components/profile_text_button.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.sidePaddings,
    required this.textTheme,
    required this.hastagPadding,
    required this.blogPostHeight,
    required this.podcastPostHeight,
  });

  final Size size;
  final double sidePaddings;
  final TextTheme textTheme;
  final double hastagPadding;
  final double blogPostHeight;
  final double podcastPostHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height / 20),
      child: Column(
        children: [
          // Avatar
          Assets.icons.avatar.image(height: size.height / 7.19),

          SizedBox(height: size.height / 58.2),

          // ویرایش عکس پروفایل
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // pencil Icon
              ImageIcon(
                Assets.icons.pencil.image().image,
                color: SolidColors.changeProfilePhoto,
              ),
              SizedBox(width: size.width / 36.71),

              // Solid String
              Text(
                Strings.changeProfilePhoto,
                style: textTheme.headline3,
              ),
            ],
          ),

          SizedBox(height: size.height / 12.24),

          Text(
            Strings.name,
            style:
                textTheme.headline3!.copyWith(color: SolidColors.primaryColor),
          ),

          SizedBox(height: size.height / 55.29),

          Text(
            Strings.gmail,
            style:
                textTheme.headline3!.copyWith(color: SolidColors.profileTexts),
          ),

          SizedBox(height: size.height / 17.22),

          ProfileDivider(size: size),

          ProfileTextButton(
            title: Strings.myFavouriteArticles,
            size: size,
            textTheme: textTheme,
          ),

          ProfileDivider(size: size),

          ProfileTextButton(
            title: Strings.myFavouritePodcasts,
            size: size,
            textTheme: textTheme,
          ),

          ProfileDivider(size: size),

          ProfileTextButton(
            title: Strings.signOutOfTheAccount,
            size: size,
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
}
