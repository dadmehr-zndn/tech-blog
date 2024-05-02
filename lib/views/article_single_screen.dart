// TODO: uncomment
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/article_horizontal_list.dart';
import 'package:tech_blog/components/image_error_widget.dart';
import 'package:tech_blog/components/loading_spinkit.dart';
import 'package:tech_blog/constants/colors.dart';
import 'package:tech_blog/constants/strings.dart';
import 'package:tech_blog/constants/text_styles.dart';
import 'package:tech_blog/controllers/article_controller.dart';
import 'package:tech_blog/controllers/article_single_controller.dart';
import 'package:tech_blog/controllers/home_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';

import '../components/single_content_appbar.dart';

class ArticleSingleScreen extends StatelessWidget {
  ArticleSingleScreen({super.key});

  ArticleSingleController articleSingleController =
      Get.put(ArticleSingleController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(
            () => articleSingleController.loading.value == false
                ? Column(
                    children: [
                      // Image Sectin (Top part)
                      Stack(
                        children: [
                          // Image
                          SizedBox(
                            height: size.height / 3.1,
                            //TODO: this is hardcode
                            child: CachedNetworkImage(
                              imageUrl: articleSingleController
                                  .articleSingleModel.value.image!,
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
                              errorWidget: (context, url, error) =>
                                  ImageErrorWidget(),
                            ),
                          ),

                          // Gradient
                          Container(
                            height: size.height / 7.06,
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
                          singleContentAppBar(size),
                        ],
                      ),

                      // Title, Author, CreatedAt
                      Padding(
                        padding: EdgeInsets.only(
                          right: size.width / 34.26,
                          top: size.height / 37.38,
                        ),
                        child: Column(
                          children: [
                            Text(
                              articleSingleController
                                  .articleSingleModel.value.title!,
                              style: articleSingleTitleTextStyle,
                            ),
                            SizedBox(height: size.height / 39),
                            Row(
                              children: [
                                Assets.icons.avatar
                                    .image(height: size.height / 18),
                                SizedBox(width: size.width / 27.05),
                                Text(
                                  articleSingleController
                                      .articleSingleModel.value.author!,
                                  style: authorTextStyle,
                                ),
                                SizedBox(width: size.width / 19.76),
                                Text(
                                  articleSingleController
                                      .articleSingleModel.value.createdAt!,
                                  style: createdAtTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: size.height / 19.11),

                      // body, category, related articles
                      Padding(
                        padding: EdgeInsets.only(right: size.width / 17.72),
                        child: Column(
                          children: [
                            // body
                            Padding(
                              padding:
                                  EdgeInsets.only(left: size.width / 17.72),
                              child: Text(
                                articleSingleController
                                    .articleSingleModel.value.content!,
                                style: articleSingleContentTextStyle,
                              ),
                            ),

                            SizedBox(height: size.height / 9.09),

                            // Category
                            SizedBox(
                              height: size.height / 22.57,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    articleSingleController.articleTags.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      right:
                                          index == 0 ? 0 : size.width / 29.37,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: SolidColors.surface,
                                        //TODO: exact radius
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width / 20),
                                          child: Text(
                                            articleSingleController
                                                .articleTags[index].title!,
                                            style:
                                                textTheme.headline4!.copyWith(
                                              color: SolidColors
                                                  .textLabelTagInside,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            SizedBox(height: size.height / 13.52),
                          ],
                        ),
                      ),

                      // Related Articles
                      // نوشته های مرتبط
                      Padding(
                        padding: EdgeInsets.only(right: size.width / 17.72),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            Strings.relatedArticles,
                            style: textTheme.headline3,
                          ),
                        ),
                      ),

                      SizedBox(height: size.height / 33.86),

                      // Related Articles ListView
                      SizedBox(
                        height: size.height / 4,
                        child: ArticlesHorizontalList(
                            sidePaddings: 20, size: size, textTheme: textTheme),
                      ),

                      SizedBox(height: size.height / 14.44),
                    ],
                  )
                : LoadingSpinKit(),
          ),
        ),
      ),
    );
  }
}
