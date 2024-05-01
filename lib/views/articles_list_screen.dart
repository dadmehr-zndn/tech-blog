//TODO: uncomment
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/customized_appbar.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/controllers/article_controller.dart';

class ArticlesListScreen extends StatelessWidget {
  ArticlesListScreen({super.key});

  ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: customizedAppBar(size, Strings.listOfArticles),
        body: SizedBox(
          child: Obx(
            () => ListView.builder(
              itemCount: articleController.articlesList.length,
              itemBuilder: (context, index) {
                return Text(articleController.articlesList[index].title!);
              },
            ),
          ),
        ),
      ),
    );
  }
}
