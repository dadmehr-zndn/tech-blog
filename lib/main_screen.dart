//todo: uncomment
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tech_blog/constants.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var sidePaddings = size.width / 12.53;
    var hastagPadding = size.width / 28.72;

    return Scaffold(
      body: Column(
        children: [
          // AppBar & PosterImage
          // I'm using this Column to give paddding AppBar and ImagePoster
          Padding(
            padding: EdgeInsets.fromLTRB(
              sidePaddings,
              size.height / 30.6,
              sidePaddings,
              0,
            ),
            child: Column(
              children: [
                // AppBar
                Padding(
                  padding: EdgeInsets.only(bottom: size.height / 29.28),
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

                // Poster
                Stack(
                  children: [
                    // Image
                    Container(
                      height: size.height / 4.20,
                      decoration: BoxDecoration(
                        //todo: check for the exact radius
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        image: DecorationImage(
                          image: AssetImage(homePageFakeDate['imagePath']),
                          fit: BoxFit.cover,
                        ),
                      ),
                      foregroundDecoration: BoxDecoration(
                        //todo: check for the exact radius
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          colors: GradientColors.homePosterOverlay,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0, 0.8, 1],
                        ),
                      ),
                    ),

                    // Title - Likes - Creator
                    Positioned(
                      bottom: size.height / 35,
                      right: 0,
                      left: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width / 13.45),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${homePageFakeDate['creator']} - ${homePageFakeDate['createdDate']}',
                                  style: textTheme.subtitle1,
                                ),
                                SizedBox(
                                  width: size.width / 9.85,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // views
                                      Text(
                                        homePageFakeDate['views'],
                                        style: textTheme.subtitle1,
                                      ),

                                      // views Icon
                                      Icon(
                                        Icons.remove_red_eye_sharp,
                                        color: SolidColors.icon,
                                        size: size.width / 30,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: size.height / 75),

                          // title
                          Text(
                            homePageFakeDate['title'],
                            style: textTheme.headline1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: size.height / 20.623),

          // Hashtags ListView
          SizedBox(
            height: size.height / 22.98,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: hashTagsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: index == 0 ? sidePaddings : hastagPadding,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      //todo: look for the exact radius
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ),
                );
              },
            ),
          ),

          SizedBox(height: size.height / 17.93),

          // مشاهده داغ ترین نوشته ها
          // View Hottest Articles
          Padding(
            padding: EdgeInsets.only(right: sidePaddings),
            child: Row(
              children: [
                ImageIcon(
                  Assets.icons.pencil.image().image,
                  color: SolidColors.showSectionTitle,
                ),
                SizedBox(width: size.width / 32.18),
                Text(
                  Strings.viewTheHottestArticles,
                  style: textTheme.headline3,
                ),
              ],
            ),
          ),

          SizedBox(height: size.height / 46.21),

          //Hottest Articles ListView
          SizedBox(
            height: size.width / 4.37,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: 15,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      right: index == 0 ? sidePaddings : size.width / 22.34),
                  child: Container(
                    width: 100,
                    height: size.width / 4.37,
                    color: Colors.blueGrey,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
