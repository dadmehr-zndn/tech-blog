//TODO: uncomment
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:tech_blog/widgets/components.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/controllers/article/articles_manage_controller.dart';
import 'package:tech_blog/themes/text_styles.dart';

// ignore: must_be_immutable
class MainArticleBodyEditor extends StatelessWidget {
  MainArticleBodyEditor({super.key});

  HtmlEditorController controller = HtmlEditorController();
  ArticlesManageController articlesManageController =
      Get.find<ArticlesManageController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.clearFocus(),
      child: Scaffold(
        appBar: customizedAppBar(title: Strings.bodyEdittingAppBar),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Get.height / 50),
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: Strings.mainArticleBodyEditting,
                  initialText:
                      articlesManageController.articleSingleModel.value.content,
                  shouldEnsureVisible: true,
                  spellCheck: true,
                ),
                htmlToolbarOptions: HtmlToolbarOptions(
                  textStyle: articleTitleInputTextStyle,
                ),
                callbacks: Callbacks(
                  onChangeContent: (content) async {
                    articlesManageController.articleSingleModel.update((val) {
                      val!.content = content;
                    });

                    log(articlesManageController.articleBodyController);
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
