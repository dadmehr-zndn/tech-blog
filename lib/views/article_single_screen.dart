// TODO: uncomment
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/image_error_widget.dart';
import 'package:tech_blog/components/loading_spinkit.dart';
import 'package:tech_blog/constants/colors.dart';
import 'package:tech_blog/controllers/article_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';

import '../components/single_content_appbar.dart';

class ArticleSingleScreen extends StatelessWidget {
  ArticleSingleScreen({super.key});

  ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Image Sectin (Top part)
            Stack(
              children: [
                // Image
                SizedBox(
                  height: size.height / 3.1,
                  //TODO: this is hardcode
                  child: CachedNetworkImage(
                    imageUrl: articleController.articlesList[2].image!,
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
                  Text(articleController.articlesList[2].title!),
                  SizedBox(height: size.height / 39),
                  Row(
                    children: [
                      Assets.icons.avatar.image(height: size.height / 18),
                      SizedBox(width: size.width / 27.05),
                      Text(articleController.articlesList[2].author!),
                      SizedBox(width: size.width / 19.76),
                      Text(articleController.articlesList[2].createdAt!),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
