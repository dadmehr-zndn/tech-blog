// TODO: uncomment
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_blog/widgets/image_error_widget.dart';
import 'package:tech_blog/widgets/loading_spinkit.dart';
import 'package:tech_blog/constants/colors.dart';
import 'package:tech_blog/constants/strings.dart';
import 'package:tech_blog/themes/text_styles.dart';
import 'package:tech_blog/controllers/article/article_list_controller.dart';
import 'package:tech_blog/controllers/article/article_single_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/article_single_model.dart';
import 'package:tech_blog/views/article/articles_list_screen.dart';
import '../../widgets/app_bars/single_content_appbar.dart';

// ignore: must_be_immutable
class ArticleSingleScreen extends StatelessWidget {
  ArticleSingleScreen({super.key});

  var articleSingleController = Get.find<ArticleSingleController>();

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
                          singleContentAppBar(),
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
                              child: HtmlWidget(
                                articleSingleController
                                    .articleSingleModel.value.content!,
                                textStyle: articleSingleContentTextStyle,
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
                                    child: GestureDetector(
                                      onTap: () async {
                                        var tagId = articleSingleController
                                            .articleTags[index].id!;
                                        var tagName = articleSingleController
                                            .articleTags[index].title!;

                                        await Get.find<ArticleListController>()
                                            .getArticlesListByTagId(tagId);

                                        Get.to(ArticlesListScreen(
                                          appBarTitle: tagName,
                                        ));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: SolidColors.surface,
                                          //TODO: exact radius
                                          borderRadius:
                                              BorderRadius.circular(22),
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
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount:
                              //TODO: there is a bug
                              articleSingleController.relatedArticles.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: index == 0
                                      ? size.width / 12.53
                                      : size.width / 22.34),
                              child: GestureDetector(
                                onTap: () async {
                                  articleSingleController.id.value =
                                      articleSingleController
                                          .relatedArticles[index].id!;
                                  articleSingleController.articleSingleModel
                                      .value = ArticleSingleModel();
                                  await articleSingleController
                                      .getArticleInfo();
                                },
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
                                              imageUrl: articleSingleController
                                                  .relatedArticles[index]
                                                  .image!,
                                              imageBuilder:
                                                  (context, imageProvider) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18),
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
                                              errorWidget:
                                                  (context, url, error) {
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
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        bottomRight:
                                                            Radius.circular(18),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                18)),
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
                                                    horizontal:
                                                        size.width / 29.74),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      articleSingleController
                                                          .relatedArticles[
                                                              index]
                                                          .author!,
                                                      style: textTheme.headline2
                                                          ?.copyWith(
                                                              fontSize: 13),
                                                    ),

                                                    // views
                                                    SizedBox(
                                                      width: size.width / 9,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        // crossAxisAlignment:
                                                        //     CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            articleSingleController
                                                                .relatedArticles[
                                                                    index]
                                                                .view!,
                                                            style: textTheme
                                                                .headline2
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        13),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .remove_red_eye_sharp,
                                                            color: SolidColors
                                                                .icon,
                                                            size:
                                                                size.width / 30,
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
                                        articleSingleController
                                            .relatedArticles[index].title!,
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
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: size.height / 14.44),
                    ],
                  )
                : SizedBox(
                    height: Get.height,
                    child: LoadingSpinKit(),
                  ),
          ),
        ),
      ),
    );
  }
}
