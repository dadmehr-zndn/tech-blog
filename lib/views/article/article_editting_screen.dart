//TODO: uncomment
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/components.dart';
import 'package:tech_blog/components/row_icon_title.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/controllers/articles_manage_controller.dart';
import 'package:tech_blog/controllers/home_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/routes/app_pages.dart';
import 'package:tech_blog/themes/text_styles.dart';

class ArticleEdittingScreen extends StatelessWidget {
  ArticleEdittingScreen({super.key});

  ArticlesManageController articlesManageController =
      Get.find<ArticlesManageController>();

  HomeScreenController homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Sectin (Top part)
            Stack(
              children: [
                // Image
                SizedBox(
                  height: Get.height / 3.1,
                  //TODO: this is hardcode
                  child: CachedNetworkImage(
                    imageUrl: articlesManageController
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
                    errorWidget: (context, url, error) => Assets
                        .images.defaultPlaceholderImage
                        .image(fit: BoxFit.cover, width: Get.width),
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
                      stops: const [0, 1],
                    ),
                  ),
                ),

                // Button Choose Picture
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: InkWell(
                      splashColor: SolidColors.clickSplashColor,
                      onTap: () {
                        //TODO: implement
                      },
                      child: Ink(
                        color: Colors.black,
                        height: Get.height / 28.05,
                        width: Get.width / 3.5,
                        child: Container(
                          // width: Get.width / 3.5,
                          // height: Get.height / 28.05,
                          decoration: BoxDecoration(
                            color: SolidColors.primaryColor,
                            //TODO: Radius
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                Strings.choosePicture,
                                style: choosePictureTextStyle,
                              ),
                              Icon(
                                Icons.add,
                                color: SolidColors.white,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // AppBar
                singleContentAppBar(),
              ],
            ),

            SizedBox(height: Get.height / 15.83),

            Padding(
              padding: EdgeInsets.only(right: Get.width / 16.85),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Edit Article Title
                  RowIconTitle(title: Strings.editArticleTitle),
                  SizedBox(height: Get.height / 85.28),
                  Text(
                    Strings.hereArticleTitle,
                    style: articleTitleInputTextStyle,
                  ),

                  SizedBox(height: Get.height / 25.56),

                  // Edit Article Body
                  RowIconTitle(title: Strings.editMainArticleText),
                  SizedBox(height: Get.height / 85.28),
                  Text(
                    Strings.iAmMainArticleBody,
                    style: articleBodyInputTextStyle,
                  ),

                  SizedBox(height: Get.height / 14.99),

                  // Choose Categories
                  RowIconTitle(title: Strings.chooseCategory),
                  SizedBox(height: Get.height / 39.28),
                  SizedBox(
                    height: Get.height / 22.57,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeScreenController.tagsList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            right: index == 0 ? 0 : Get.width / 29.37,
                          ),
                          child: GestureDetector(
                            onTap: () async {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: SolidColors.surface,
                                //TODO: exact radius
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Get.width / 20),
                                  child: Text(
                                    homeScreenController.tagsList[index].title!,
                                    style: Get.textTheme.headline4!.copyWith(
                                      color: SolidColors.textLabelTagInside,
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
                  )
                ],
              ),
            ),

            SizedBox(height: Get.height / 9),

            ElevatedButton(
              onPressed: () {},
              child: Text(
                Strings.buttonDone,
                style: TextStyle(color: SolidColors.white),
              ),
            ),

            SizedBox(height: Get.height / 38.05),
          ],
        ),
      ),
    ));
  }
}
