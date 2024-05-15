//TODO: uncomment
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/customized_appbar.dart';
import 'package:tech_blog/components/image_error_widget.dart';
import 'package:tech_blog/components/loading_spinkit.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/controllers/articles_manage_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/themes/text_styles.dart';

class ArticlesManagedScreen extends StatelessWidget {
  ArticlesManagedScreen({super.key});

  ArticlesManageController articlesManageController =
      Get.find<ArticlesManageController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: customizedAppBar(title: Strings.manageArticles),
      body: SafeArea(
        child: Obx(
          () => articlesManageController.articleList.isNotEmpty
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: articlesManageController.articleList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          right: size.width / 21.87,
                          bottom: size.height / 25.17,
                          top: index == 0 ? size.height / 36.72 : 0),
                      child: GestureDetector(
                        onTap: () async {},
                        child: SizedBox(
                          height: size.height / 7.73,
                          child: Row(
                            children: [
                              // article image
                              SizedBox(
                                width: size.width / 4.17,
                                child: CachedNetworkImage(
                                  imageUrl: articlesManageController
                                      .articleList[index].image!,
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

                              SizedBox(width: size.width / 32.125),

                              // article title, views
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width / 1.57,
                                    child: Text(
                                      articlesManageController
                                          .articleList[index].title!,
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
                                          articlesManageController
                                              .articleList[index].author!,
                                          style: articleAuthorViewsTextStyle,
                                        ),
                                        SizedBox(width: size.width / 44.69),
                                        Text(
                                          Strings.view,
                                          style: articleAuthorViewsTextStyle,
                                        ),
                                        SizedBox(width: size.width / 91.07),
                                        Text(
                                          articlesManageController
                                              .articleList[index].view!,
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
                                                articlesManageController
                                                    .articleList[index]
                                                    .catName!,
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
                      ),
                    );
                  },
                )
              : EmptyState(),
        ),
      ),
    );
  }
}

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // techBot Image
              SvgPicture.asset(
                Assets.images.techBotSad.path,
                height: Get.height / 6.08,
              ),

              SizedBox(height: Get.height / 32.44),

              // Welcome Text
              Text(
                Strings.noArticlesAvaiable,
                style: Get.textTheme.headline4!.copyWith(
                  color: SolidColors.sharingBody,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Get.height / 15),
            ],
          ),
        ),

        // Button write article
        Padding(
          padding: EdgeInsets.only(bottom: Get.width / 38.05),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {},
              child:
                  Text(Strings.buttonWriteArticle, style: Get.textTheme.button),
            ),
          ),
        ),
      ],
    );
  }
}