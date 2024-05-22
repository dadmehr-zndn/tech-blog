//TODO: uncomment
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/components.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/themes/text_styles.dart';

class PodcastSingleScreen extends StatelessWidget {
  const PodcastSingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 12.53, vertical: Get.height / 63.35),
          child: Container(
            height: Get.height / 7,
            decoration: Decorations.mainGradientBoxDecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Progress Bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.height / 16.5),
                  child: Transform.flip(
                    flipX: true,
                    child: LinearProgressIndicator(
                      value: 0.4,
                      color: SolidColors.podcastProgressFill,
                      backgroundColor: SolidColors.podcastProgressBar,
                      minHeight: Get.height / 130.93,
                    ),
                  ),
                ),

                SizedBox(height: Get.height / 46.76),

                // Action Buttons
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.skip_next_rounded,
                        size: 40,
                        color: SolidColors.icon,
                      ),
                      Icon(
                        Icons.play_circle,
                        size: 45,
                        color: SolidColors.icon,
                      ),
                      Icon(
                        Icons.skip_previous_rounded,
                        size: 40,
                        color: SolidColors.icon,
                      ),
                      SizedBox(width: Get.width / 7.2),
                      ImageIcon(
                        Assets.icons.podcastRepeat.image().image,
                        color: SolidColors.podcastRepeatIconColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Sectin (Top part)
              Stack(
                children: [
                  // Image
                  SizedBox(
                    height: Get.height / 3.1,
                    child: CachedNetworkImage(
                      imageUrl:
                          //TODO: hardcode
                          'https://tehranpodcast.ir/wp-content/uploads/2020/09/9061830-1600580901613-4facd1a4980a3.jpg',
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      placeholder: (context, url) => LoadingSpinKit(),
                      errorWidget: (context, url, error) => ImageErrorWidget(),
                    ),
                  ),

                  // Gradient
                  Container(
                    height: Get.height / 7.06,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: GradientColors.posterOpened,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 1],
                      ),
                    ),
                  ),

                  // AppBar
                  singleContentAppBar(),
                ],
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 19.76),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height / 43.01),

                    // Title
                    Padding(
                      padding: EdgeInsets.only(right: Get.width / 25),
                      child: Text(
                        'پادکست : ' + 'Title',
                        style: podcastSingleTitleTextStyle,
                      ),
                    ),

                    SizedBox(height: Get.height / 50.35),

                    // Profile & Name
                    Row(
                      children: [
                        Assets.icons.avatar.image(height: Get.height / 18),
                        SizedBox(width: Get.width / 27.05),
                        Text(
                          'دادمهر زندیان',
                          style: authorTextStyle,
                        ),
                      ],
                    ),

                    SizedBox(height: Get.height / 20.89),

                    // Podcast Episodes
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width / 90),
                      child: ListView.builder(
                        shrinkWrap: true,
                        // primary: false,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                EdgeInsets.only(bottom: Get.height / 33.86),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    // Microphone Icon
                                    ImageIcon(
                                      Assets.icons.microphone.image().image,
                                      color: SolidColors.podcastIconSingle,
                                    ),

                                    SizedBox(width: Get.width / 17.13),

                                    // Section name
                                    Text(
                                      'data',
                                      style: podcastSectionTitleTextStyle,
                                    ),
                                  ],
                                ),
                                // Episode Duration
                                Text(
                                  '25:00',
                                  style: podcastDurationTextStyle,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
