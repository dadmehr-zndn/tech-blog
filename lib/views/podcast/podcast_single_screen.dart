// ignore_for_file: public_member_api_docs, sort_constructors_first
//TODO: uncomment
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'package:tech_blog/components/components.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/controllers/podcast/podcast_single_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/home_top_podcasts_model.dart';
import 'package:tech_blog/themes/text_styles.dart';

// ignore: must_be_immutable
class PodcastSingleScreen extends StatelessWidget {
  late PodcastSingleController podcastController;
  late HomeTopPodcastsModel podcastModel;

  PodcastSingleScreen() {
    podcastModel = Get.arguments;
    podcastController = Get.put(PodcastSingleController(id: podcastModel.id));
  }

  @override
  Widget build(BuildContext context) {
    // bool isPlaying = podcastSingleController.isPlaying.value;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 12.53, vertical: Get.height / 63.35),
          child: Container(
            height: Get.height / 5.5,
            decoration: Decorations.mainGradientBoxDecoration,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height / 90),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Progress Bar
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Get.height / 16.5),
                    child: Obx(
                      () => ProgressBar(
                        baseBarColor: SolidColors.podcastProgressBar,
                        progressBarColor: SolidColors.podcastProgressFill,
                        thumbColor:
                            SolidColors.podcastProgressFill.withGreen(210),
                        bufferedBarColor: SolidColors.podcastBufferedColor,
                        timeLabelTextStyle: podcastProgressDurationTextStyle,
                        thumbRadius: 7,
                        thumbGlowRadius: 15,
                        progress: podcastController.progressValue.value,
                        buffered: podcastController.bufferedValue.value,
                        total: podcastController.player.duration ??
                            Duration(seconds: 0),
                        onSeek: (duration) {
                          podcastController.player.seek(duration);
                          podcastController.player.playing
                              ? podcastController.startProgressing()
                              : podcastController.timer!.cancel();
                        },
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
                        GestureDetector(
                          onTap: () async {
                            await podcastController.player.seekToNext();
                            podcastController.currentFileIndex.value =
                                podcastController.player.currentIndex!;

                            podcastController.startProgressing();
                          },
                          child: Icon(
                            Icons.skip_next_rounded,
                            size: 40,
                            color: SolidColors.icon,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (podcastController.isPlaying.value) {
                              podcastController.player.pause();
                              podcastController.timer!.cancel();
                            } else {
                              podcastController.player.play();
                              podcastController.startProgressing();
                            }

                            // podcastController.isPlaying.value
                            //     ? podcastController.player.pause()
                            //     : podcastController.player.play();

                            podcastController.isPlaying.value =
                                podcastController.player.playing;

                            podcastController.currentFileIndex.value =
                                podcastController.player.currentIndex!;
                          },
                          child: Obx(
                            () => Icon(
                              podcastController.isPlaying.value
                                  ? Icons.pause_circle_filled_rounded
                                  : Icons.play_circle_fill_rounded,
                              size: 45,
                              color: SolidColors.icon,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await podcastController.player.seekToPrevious();
                            podcastController.currentFileIndex.value =
                                podcastController.player.currentIndex!;

                            podcastController.startProgressing();
                          },
                          child: Icon(
                            Icons.skip_previous_rounded,
                            size: 40,
                            color: SolidColors.icon,
                          ),
                        ),
                        SizedBox(width: Get.width / 7.2),
                        GestureDetector(
                          onTap: () => podcastController.toggleRepeatMode(),
                          child: Obx(
                            () => ImageIcon(
                              Assets.icons.podcastRepeat.image().image,
                              color: podcastController.isRepeat.value
                                  ? SolidColors.podcastRepeatIconColor
                                  : SolidColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                      imageUrl: podcastModel.poster!,
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
                        'پادکست : ${podcastModel.title}',
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
                      child: Obx(
                        () => !podcastController.isLoading.value
                            ? podcastController.podcastFilesList.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    // primary: false,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: podcastController
                                        .podcastFilesList.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () async {
                                          await podcastController.player.seek(
                                            Duration.zero,
                                            index: index,
                                          );

                                          podcastController
                                              .currentFileIndex.value = index;

                                          podcastController.startProgressing();
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              bottom: Get.height / 33.86),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  // Microphone Icon
                                                  ImageIcon(
                                                    Assets.icons.microphone
                                                        .image()
                                                        .image,
                                                    color: SolidColors
                                                        .podcastIconSingle,
                                                  ),

                                                  SizedBox(
                                                      width: Get.width / 17.13),

                                                  // Section name
                                                  SizedBox(
                                                    width: Get.width / 1.8,
                                                    child: Obx(
                                                      () => Text(
                                                        podcastController
                                                            .podcastFilesList[
                                                                index]
                                                            .title!,
                                                        style: podcastController
                                                                    .currentFileIndex
                                                                    .value ==
                                                                index
                                                            ? podcastSectionSelectedTextStyle
                                                            : podcastSectionTitleTextStyle,
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // Episode Duration
                                              Text(
                                                '${podcastController.podcastFilesList[index].length!}:00',
                                                style: podcastDurationTextStyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : Center(
                                    child: Text(
                                      Strings.noPodcastFile,
                                      style: noPodcastFileTextStyle,
                                    ),
                                  )
                            : SpinKitWave(
                                color: SolidColors.primaryColor,
                                size: 22,
                              ),
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
