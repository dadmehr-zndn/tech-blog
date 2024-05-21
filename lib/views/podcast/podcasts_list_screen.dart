//TODO: uncomment
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/components.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/controllers/podcast/podcasts_list_controller.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/themes/text_styles.dart';

class PodcastsListScreen extends StatelessWidget {
  PodcastsListScreen({super.key});

  PodcastsListController podcastsListController =
      Get.put(PodcastsListController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customizedAppBar(title: Strings.listOfPodcasts),
        body: Obx(
          () => podcastsListController.isLoading.value == false
              ? Padding(
                  padding: EdgeInsets.only(
                    top: Get.height / 23.38,
                    right: Get.width / 12.53,
                  ),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: podcastsListController.podcastsList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: index == 0 ? 0 : Get.height / 28.88),
                        child: SizedBox(
                          height: Get.height / 8.5,
                          child: Row(
                            children: [
                              //Podcast Image
                              SizedBox(
                                width: Get.width / 4.78,
                                child: CachedNetworkImage(
                                  imageUrl: podcastsListController
                                              .podcastsList[index].poster !=
                                          "https://techblog.sasansafari.com''"
                                      ? podcastsListController
                                          .podcastsList[index].poster!
                                      : podcastList[index].imageUrl,
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        // TODO: check for the radius
                                        borderRadius: BorderRadius.circular(18),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                  placeholder: (context, url) =>
                                      LoadingSpinKit(),
                                  errorWidget: (context, url, error) =>
                                      ImageErrorWidget(),
                                ),
                              ),

                              SizedBox(width: Get.width / 38.07),

                              // Podcast title, author
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Title
                                  Text(
                                    podcastsListController
                                        .podcastsList[index].title!,
                                    style: podcastTitleTextStyle,
                                  ),

                                  SizedBox(height: Get.height / 85),

                                  // Author
                                  Text(
                                    podcastsListController.podcastsList[index]
                                                .publisher !=
                                            null
                                        ? podcastsListController
                                            .podcastsList[index].publisher!
                                        : Strings.name,
                                    style: podcastAuthorViewsTextStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : SizedBox(
                  height: Get.height,
                  child: LoadingSpinKit(),
                ),
        ),
      ),
    );
  }
}
