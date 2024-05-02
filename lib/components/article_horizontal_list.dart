import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/components.dart';
import 'package:tech_blog/constants/colors.dart';
import 'package:tech_blog/controllers/home_screen_controller.dart';

class ArticlesHorizontalList extends StatelessWidget {
  const ArticlesHorizontalList({
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
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: Get.find<HomeScreenController>().topArticlesList.length,
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
                        imageUrl: Get.find<HomeScreenController>()
                            .topArticlesList[index]
                            .image!,
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
                          return const ImageErrorWidget();
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
                          borderRadius: const BorderRadius.only(
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
                                Get.find<HomeScreenController>()
                                    .topArticlesList[index]
                                    .author!,
                                style:
                                    textTheme.headline2?.copyWith(fontSize: 13),
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
                                      Get.find<HomeScreenController>()
                                          .topArticlesList[index]
                                          .view!,
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
                  Get.find<HomeScreenController>()
                      .topArticlesList[index]
                      .title!,
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
    );
  }
}
