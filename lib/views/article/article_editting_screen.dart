//TODO: uncomment
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/components/app_bars/article_manage_appbar.dart';
import 'package:tech_blog/components/components.dart';
import 'package:tech_blog/components/row_icon_title.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/constants/storage.dart';
import 'package:tech_blog/controllers/articles_manage_controller.dart';
import 'package:tech_blog/controllers/file_picker_controller.dart';
import 'package:tech_blog/controllers/home_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/services/file_picker.dart';
import 'package:tech_blog/themes/text_styles.dart';
import 'package:tech_blog/views/article/main_article_body_editor.dart';

class ArticleEdittingScreen extends StatelessWidget {
  ArticleEdittingScreen({super.key});

  ArticlesManageController articlesManageController =
      Get.find<ArticlesManageController>();
  HomeScreenController homeScreenController = Get.find<HomeScreenController>();
  FilePickerController filePickerController = Get.put(FilePickerController());

  getArticleTitle() => Get.defaultDialog(
        title: Strings.articleTitle,
        titleStyle: articleDialogTitleTextStyle,
        backgroundColor: SolidColors.primaryColor,
        content: Container(
          decoration: BoxDecoration(
            color: SolidColors.white,
            borderRadius: BorderRadius.circular(13),
          ),
          child: TextField(
            controller: articlesManageController.articleTitleController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: Strings.editArticleTitleHintText,
            ),
            style: articleTitleDialogInputTextStyle,
          ),
        ),
        radius: 10,
        confirm: TextButton(
          onPressed: () {
            articlesManageController.updateTitle();
            Get.back();
          },
          child: Text(
            Strings.sumbit,
            style: TextStyle(color: SolidColors.white),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                // Image Sectin (Top part)
                Stack(
                  children: [
                    // Image
                    SizedBox(
                      height: Get.height / 3.1,
                      //TODO: this is hardcode
                      child: filePickerController.file.value.name == 'nothing'
                          ? CachedNetworkImage(
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
                            )
                          : Image.file(
                              File(filePickerController.file.value.path!),
                              fit: BoxFit.cover,
                              width: Get.width,
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
                            pickImage();

                            //TODO: not sure
                            saveImage();
                          },
                          child: Container(
                            width: Get.width / 3.5,
                            height: Get.height / 28.05,
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

                    // AppBar
                    articleManageAppBar(),
                  ],
                ),

                SizedBox(height: Get.height / 15.83),

                Padding(
                  padding: EdgeInsets.only(right: Get.width / 16.85),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Edit Article Title
                      GestureDetector(
                          onTap: () => getArticleTitle(),
                          child: RowIconTitle(title: Strings.editArticleTitle)),
                      SizedBox(height: Get.height / 85.28),
                      Text(
                        articlesManageController.isTitleEmpty.value == false
                            ? articlesManageController
                                .articleSingleModel.value.title!
                            : Strings.hereArticleTitle,
                        style: articleTitleInputTextStyle,
                      ),

                      SizedBox(height: Get.height / 25.56),

                      // Edit Article Body
                      GestureDetector(
                          onTap: () {
                            Get.to(() => MainArticleBodyEditor());
                          },
                          child:
                              RowIconTitle(title: Strings.editMainArticleText)),
                      SizedBox(height: Get.height / 85.28),
                      HtmlWidget(
                        articlesManageController
                            .articleSingleModel.value.content!,
                        textStyle: articleBodyInputTextStyle,
                        enableCaching: true,
                        onLoadingBuilder: (context, element, loadingProgress) =>
                            LoadingSpinKit(),
                      ),

                      SizedBox(height: Get.height / 14.99),

                      // Choose Categories
                      GestureDetector(
                          onTap: () {
                            openChoosingCategoryBottomSheet();
                          },
                          child: RowIconTitle(title: Strings.chooseCategory)),
                      SizedBox(height: Get.height / 39.28),
                      SizedBox(
                        height: Get.height / 22.57,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: Get.width / 29.37,
                          ),
                          child: articlesManageController
                                      .articleSingleModel.value.catName ==
                                  null
                              ? Text(
                                  Strings.noChosenCategory,
                                  style: noChosenCategoryTextStyle,
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: SolidColors.surface,
                                    //TODO: exact radius
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: Get.width / 20,
                                      left: Get.width / 20,
                                      top: Get.height / 145,
                                    ),
                                    child: Text(
                                      articlesManageController
                                          .articleSingleModel.value.catName!,
                                      style: Get.textTheme.headline4!.copyWith(
                                        color: SolidColors.textLabelTagInside,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: Get.height / 9),

                ElevatedButton(
                  onPressed: () async {
                    // print(GetStorage().read(Storage.token));
                    await articlesManageController.storeArticle();
                  },
                  child: Text(
                    Strings.buttonDone,
                    style: TextStyle(color: SolidColors.white),
                  ),
                ),

                SizedBox(height: Get.height / 38.05),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openChoosingCategoryBottomSheet() {
    Get.bottomSheet(
      Container(
        height: Get.height / 1.5,
        width: Get.width,
        decoration: BoxDecoration(
          color: SolidColors.bottomSheetBgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(Get.height / 25),
          child: Column(
            children: [
              Text(
                Strings.chooseCategory,
                style: choosingCategoryBottomSheetTextStyle,
              ),
              SizedBox(height: Get.height / 25),
              SizedBox(
                height: Get.height / 2.5,
                child: MasonryGridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: homeScreenController.tagsList.length,
                  mainAxisSpacing: Get.width / 18.75,
                  crossAxisSpacing: Get.height / 65.46,
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        articlesManageController.articleSingleModel
                            .update((val) {
                          val!.catName =
                              homeScreenController.tagsList[index].title;
                          val!.catId = homeScreenController.tagsList[index].id;
                        });

                        Get.back();
                      },
                      child: Hashtag(
                        size: Get.size,
                        textTheme: Get.textTheme,
                        index: index,
                        isArticleManaging: true,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
