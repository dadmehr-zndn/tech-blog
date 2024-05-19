import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/article_single_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class ArticlesManageController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  Rx<ArticleSingleModel> articleSingleModel =
      ArticleSingleModel(image: '', content: Strings.iAmMainArticleBody).obs;
  TextEditingController articleTitleController = TextEditingController();
  var articleBodyController = '';
  RxBool loading = false.obs;
  RxBool isTitleEmpty = true.obs;
  RxBool isBodyLoading = false.obs;

  getManagedArticles([String? userId]) async {
    print('userId: $userId');

    loading.value = true;

    var response =
        await DioService().getMethod('${ApiConstants.getMyArticles}1');

    if (response.statusCode == 200) {
      articleList.clear();
      response.data.forEach(
          (element) => articleList.add(ArticleModel.fromJson(element)));

      loading.value = false;
    }

    log('myArticles: ${response.data}');
  }

  updateTitle() {
    articleSingleModel
        .update((val) => val!.title = articleTitleController.value.text);

    isTitleEmpty.value = false;
  }

  updateBody() {
    articleSingleModel.update((val) => val!.content = articleBodyController);

    isBodyLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();

    getManagedArticles();
  }
}
