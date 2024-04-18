//todo: uncomment
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tech_blog/constants.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/view/profile_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var sidePaddings = size.width / 12.53;
    var hastagPadding = size.width / 28.72;
    // var blogPostHeight = size.height / 4.37;
    var blogPostHeight = size.height / 4;
    var podcastPostHeight = size.height / 4.2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: SolidColors.appbar,
        title: Padding(
          padding: EdgeInsets.fromLTRB(
            sidePaddings,
            size.height / 30.6,
            sidePaddings,
            size.height / 29.28,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                size: size.width / 17,
              ),
              Assets.images.logo.image(height: size.height / 13.63),
              Transform.scale(
                scaleX: -1,
                child: Icon(
                  Icons.search,
                  size: size.width / 17,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: ProfileScreen(
              size: size,
              sidePaddings: sidePaddings,
              textTheme: textTheme,
              hastagPadding: hastagPadding,
              blogPostHeight: blogPostHeight,
              podcastPostHeight: podcastPostHeight,
            ),
          ),

          // Bottom Navigation Bar
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: size.height / 5.89,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: GradientColors.navigationBarBackground,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0, 0.4, 1],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: size.height / 14),
                child: Center(
                  child: Container(
                    height: size.height / 12.41,
                    width: size.width / 1.36,
                    decoration: BoxDecoration(
                      //todo: check for the exact redius
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          colors: GradientColors.bottomNavigation),
                    ),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ImageIcon(
                          Assets.icons.home.image().image,
                          color: SolidColors.icon,
                        ),
                        ImageIcon(
                          Assets.icons.feather.image().image,
                          color: SolidColors.icon,
                        ),
                        ImageIcon(
                          Assets.icons.user.image().image,
                          color: SolidColors.icon,
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
