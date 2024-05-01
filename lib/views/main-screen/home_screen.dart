//TODO: uncomment
// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tech_blog/components/hashtag.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/controllers/home_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';

import '../../components/image_error_widget.dart';
import '../../components/loading_spinkit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
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

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Padding(
          padding: EdgeInsets.only(bottom: size.height / 6.5),
          child: homeScreenController.loading.value == false
              ? Column(
                  children: [
                    homeScreenPoster(),
                    SizedBox(height: size.height / 20.623),
                    homePageHashTagList(),
                    SizedBox(height: size.height / 17.93),
                    HomePageViewHottestArticles(
                      sidePaddings: sidePaddings,
                      size: size,
                      textTheme: textTheme,
                    ),
                    SizedBox(height: size.height / 46.21),
                    homePageHottestArticlesList(),
                    SizedBox(height: size.height / 14.76),
                    HomePageViewHottestPodcasts(
                      sidePaddings: sidePaddings,
                      size: size,
                      textTheme: textTheme,
                    ),
                    SizedBox(height: size.height / 37.09),
                    homePageHottestPodcastsList(),
                  ],
                )
              : SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget homePageHottestArticlesList() {
    return SizedBox(
      height: blogPostHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: homeScreenController.topArticlesList.length,
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
                      SizedBox(
                        height: size.height / 5.53,
                        width: size.width / 2.66,
                        child: CachedNetworkImage(
                          imageUrl: homeScreenController
                              .topArticlesList[index].image!,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          placeholder: (context, url) {
                            return LoadingSpinKit();
                          },
                          errorWidget: (context, url, error) {
                            return ImageErrorWidget();
                          },
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
                                  homeScreenController
                                      .topArticlesList[index].author!,
                                  style: textTheme.headline2
                                      ?.copyWith(fontSize: 13),
                                ),

                                // views
                                SizedBox(
                                  width: size.width / 9,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        homeScreenController
                                            .topArticlesList[index].view!,
                                        style: textTheme.headline2
                                            ?.copyWith(fontSize: 13),
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
                    homeScreenController.topArticlesList[index].title!,
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

  Widget homeScreenPoster() {
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
                child: CachedNetworkImage(
                  imageUrl: homeScreenController.homePoster.value.image!,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      //TODO: check for the exact radius
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, _) => LoadingSpinKit(),
                  errorWidget: (context, url, error) => Icon(
                    Icons.image_not_supported_outlined,
                    color: Colors.grey,
                    size: 38,
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
                        homeScreenController.homePoster.value.title!,
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

  Widget homePageHottestPodcastsList() {
    return SizedBox(
      height: podcastPostHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: homeScreenController.topPodcastsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: index == 0 ? sidePaddings : size.width / 19.56),
            child: Column(
              children: [
                // podcast image
                SizedBox(
                  width: size.width / 3.16,
                  height: size.height / 5.81,
                  child: CachedNetworkImage(
                    imageUrl: homeScreenController
                                .topPodcastsList[index].poster !=
                            "${ApiConstants.baseDlUrl}''"
                        ? homeScreenController.topPodcastsList[index].poster!
                        : podcastList[index].imageUrl,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    placeholder: (context, url) {
                      return LoadingSpinKit();
                    },
                    errorWidget: (context, url, error) {
                      return Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.grey,
                        size: 38,
                      );
                    },
                  ),
                ),

                SizedBox(height: size.height / 42.14),

                // podcast title
                Text(
                  homeScreenController.topPodcastsList[index].title!,
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

  Widget homePageHashTagList() {
    return SizedBox(
      height: size.height / 22.98,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: homeScreenController.tagsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == 0 ? sidePaddings : hastagPadding,
            ),
            child: Hashtag(
              size: size,
              textTheme: textTheme,
              index: index,
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
