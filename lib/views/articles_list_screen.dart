//TODO: uncomment
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/customized_appbar.dart';
import 'package:tech_blog/components/image_error_widget.dart';
import 'package:tech_blog/components/loading_spinkit.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/constants/text_styles.dart';
import 'package:tech_blog/controllers/article_list_controller.dart';
import 'package:tech_blog/controllers/article_single_controller.dart';
import 'package:tech_blog/views/article_single_screen.dart';

class ArticlesListScreen extends StatelessWidget {
  ArticlesListScreen({super.key});

  ArticleListController articleListController =
      Get.put(ArticleListController());
  ArticleSingleController articleSingleController =
      Get.put(ArticleSingleController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: customizedAppBar(size, Strings.listOfArticles),
        body: SizedBox(
          child: Obx(
            () => ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: articleListController.articlesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      right: size.width / 21.87,
                      bottom: size.height / 25.17,
                      top: index == 0 ? size.height / 36.72 : 0),
                  child: SizedBox(
                    height: size.height / 7.73,
                    child: Row(
                      children: [
                        // article image
                        SizedBox(
                          width: size.width / 4.17,
                          child: CachedNetworkImage(
                            imageUrl: articleListController
                                .articlesList[index].image!,
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
                            placeholder: (context, url) => LoadingSpinKit(),
                            errorWidget: (context, url, error) =>
                                ImageErrorWidget(),
                          ),
                        ),

                        SizedBox(width: size.width / 32.125),

                        // article title, views
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                articleSingleController.id.value =
                                    articleListController
                                        .articlesList[index].id!;
                                await articleSingleController.getArticleInfo();
                                Get.to(ArticleSingleScreen());
                              },
                              child: SizedBox(
                                width: size.width / 1.57,
                                child: Text(
                                  articleListController
                                      .articlesList[index].title!,
                                  style: articleTitleTextStyle,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            SizedBox(height: size.height / 48.49),
                            SizedBox(
                              width: size.width / 1.57,
                              child: Row(
                                children: [
                                  Text(
                                    articleListController
                                        .articlesList[index].author!,
                                    style: articleAuthorViewsTextStyle,
                                  ),
                                  SizedBox(width: size.width / 44.69),
                                  Text(
                                    Strings.view,
                                    style: articleAuthorViewsTextStyle,
                                  ),
                                  SizedBox(width: size.width / 91.07),
                                  Text(
                                    articleListController
                                        .articlesList[index].view!,
                                    style: articleAuthorViewsTextStyle,
                                  ),

                                  // category
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: size.width / 30),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          articleListController
                                              .articlesList[index].catName!,
                                          style: articleCategoryTextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
