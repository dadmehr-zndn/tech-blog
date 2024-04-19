//TODO: uncomment
// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tech_blog/constants.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: size.height / 6.5),
        child: Column(
          children: [
            HomeScreenPoster(
              sidePaddings: sidePaddings,
              size: size,
              textTheme: textTheme,
            ),
            SizedBox(height: size.height / 20.623),
            HomePageHashtagList(
              size: size,
              sidePaddings: sidePaddings,
              hastagPadding: hastagPadding,
              textTheme: textTheme,
            ),
            SizedBox(height: size.height / 17.93),
            HomePageViewHottestArticles(
              sidePaddings: sidePaddings,
              size: size,
              textTheme: textTheme,
            ),
            SizedBox(height: size.height / 46.21),
            HomePageHottestArticlesList(
              blogPostHeight: blogPostHeight,
              sidePaddings: sidePaddings,
              size: size,
              textTheme: textTheme,
            ),
            SizedBox(height: size.height / 14.76),
            HomePageViewHottestPodcasts(
              sidePaddings: sidePaddings,
              size: size,
              textTheme: textTheme,
            ),
            SizedBox(height: size.height / 37.09),
            HomePageHottestPodcastsList(
              podcastPostHeight: podcastPostHeight,
              sidePaddings: sidePaddings,
              size: size,
              textTheme: textTheme,
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageHottestPodcastsList extends StatelessWidget {
  const HomePageHottestPodcastsList({
    super.key,
    required this.podcastPostHeight,
    required this.sidePaddings,
    required this.size,
    required this.textTheme,
  });

  final double podcastPostHeight;
  final double sidePaddings;
  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: podcastPostHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: podcastList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: index == 0 ? sidePaddings : size.width / 19.56),
            child: Column(
              children: [
                // podcast image
                Container(
                  width: size.width / 3.16,
                  height: size.height / 5.81,
                  decoration: BoxDecoration(
                    //TODO: check for the exact radius
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      image: NetworkImage(podcastList[index].imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(height: size.height / 42.14),

                // podcast title
                Text(
                  podcastList[index].title,
                  style: textTheme.headline1!.copyWith(
                      color: SolidColors.podcastTitle, fontSize: 18.5),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomePageViewHottestPodcasts extends StatelessWidget {
  const HomePageViewHottestPodcasts({
    super.key,
    required this.sidePaddings,
    required this.size,
    required this.textTheme,
  });

  final double sidePaddings;
  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: sidePaddings),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.microphone.image().image,
            color: SolidColors.showSectionTitle,
          ),
          SizedBox(width: size.width / 32.18),
          Text(
            Strings.viewTheHottestPodcasts,
            style: textTheme.headline3,
          ),
        ],
      ),
    );
  }
}

class HomePageHottestArticlesList extends StatelessWidget {
  const HomePageHottestArticlesList({
    super.key,
    required this.blogPostHeight,
    required this.sidePaddings,
    required this.size,
    required this.textTheme,
  });

  final double blogPostHeight;
  final double sidePaddings;
  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: blogPostHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: blogList.length - 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: index == 0 ? sidePaddings : size.width / 22.34),
            child: SizedBox(
              width: size.width / 2.66,
              child: Column(
                children: [
                  // Blog Image & Creator & Views
                  Stack(
                    children: [
                      // Blog Image
                      Container(
                        height: size.height / 5.53,
                        width: size.width / 2.66,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: DecorationImage(
                            image: NetworkImage(blogList[index].imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Gradient
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: size.height / 11.03,
                          width: size.width / 2.66,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(18),
                                bottomLeft: Radius.circular(18)),
                            gradient: LinearGradient(
                              colors: GradientColors.list,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),

                      // Creator & Views
                      Positioned(
                        bottom: size.height / 87.95,
                        child: SizedBox(
                          width: size.width / 2.66,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width / 29.74),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  blogList[index].creator,
                                  style: textTheme.headline2
                                      ?.copyWith(fontSize: 15),
                                ),

                                // views
                                SizedBox(
                                  width: size.width / 10,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        blogList[index].views,
                                        style: textTheme.headline2
                                            ?.copyWith(fontSize: 15),
                                      ),
                                      Icon(
                                        Icons.remove_red_eye_sharp,
                                        color: SolidColors.icon,
                                        size: size.width / 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: size.height / 82.72),

                  Text(
                    blogList[index].title,
                    style: textTheme.headline2!.copyWith(
                      color: SolidColors.articleBody,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomePageViewHottestArticles extends StatelessWidget {
  const HomePageViewHottestArticles({
    super.key,
    required this.sidePaddings,
    required this.size,
    required this.textTheme,
  });

  final double sidePaddings;
  final Size size;
  final TextTheme textTheme;

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
          SizedBox(width: size.width / 32.18),
          Text(
            Strings.viewTheHottestArticles,
            style: textTheme.headline3,
          ),
        ],
      ),
    );
  }
}

class HomePageHashtagList extends StatelessWidget {
  const HomePageHashtagList({
    super.key,
    required this.size,
    required this.sidePaddings,
    required this.hastagPadding,
    required this.textTheme,
  });

  final Size size;
  final double sidePaddings;
  final double hastagPadding;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                //TODO: look for the exact radius
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
    );
  }
}

class HomeScreenPoster extends StatelessWidget {
  const HomeScreenPoster({
    super.key,
    required this.sidePaddings,
    required this.size,
    required this.textTheme,
  });

  final double sidePaddings;
  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        sidePaddings,
        size.height / 30.6,
        sidePaddings,
        0,
      ),
      child: Column(
        children: [
          // Poster
          Stack(
            children: [
              // Image
              Container(
                height: size.height / 4.20,
                decoration: BoxDecoration(
                  //TODO: check for the exact radius
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  image: DecorationImage(
                    image: AssetImage(homePageFakeDate['imagePath']),
                    fit: BoxFit.cover,
                  ),
                ),
                foregroundDecoration: BoxDecoration(
                  //TODO: check for the exact radius
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
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width / 13.45),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width / 11.03),
                      child: Text(
                        homePageFakeDate['title'],
                        style: textTheme.headline1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
