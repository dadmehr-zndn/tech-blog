//TODO: uncomment
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/widgets/app_bars/customized_appbar.dart';
import 'package:tech_blog/widgets/image_error_widget.dart';
import 'package:tech_blog/widgets/loading_spinkit.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/themes/text_styles.dart';
import 'package:tech_blog/controllers/article/article_list_controller.dart';
import 'package:tech_blog/controllers/article/article_single_controller.dart';

class ArticlesListScreen extends StatefulWidget {
  const ArticlesListScreen(
      {super.key, this.appBarTitle = Strings.listOfArticles});

  final String appBarTitle;

  @override
  State<ArticlesListScreen> createState() => _ArticlesListScreenState();
}

class _ArticlesListScreenState extends State<ArticlesListScreen> {
  var articleListController = Get.find<ArticleListController>();

  var articleSingleController = Get.find<ArticleSingleController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: customizedAppBar(title: 'لیست ${widget.appBarTitle}'),
        body: SizedBox(
          child: Obx(
            () => articleListController.loading.value == false
                ? ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: articleListController.articlesList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            right: size.width / 21.87,
                            bottom: size.height / 25.17,
                            top: index == 0 ? size.height / 36.72 : 0),
                        child: GestureDetector(
                          onTap: () async {
                            articleSingleController.id.value =
                                articleListController.articlesList[index].id!;
                            await articleSingleController.getArticleInfo();
                          },
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
                                          borderRadius:
                                              BorderRadius.circular(18),
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

                                SizedBox(width: size.width / 32.125),

                                // article title, views
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Title
                                    SizedBox(
                                      width: size.width / 1.57,
                                      child: Text(
                                        articleListController
                                            .articlesList[index].title!,
                                        style: articleTitleTextStyle,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
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
                                                      .articlesList[index]
                                                      .catName!,
                                                  style:
                                                      articleCategoryTextStyle,
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
                        ),
                      );
                    },
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
