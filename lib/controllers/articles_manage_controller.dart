import 'dart:developer';

import 'package:get/get.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class ArticlesManageController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  RxBool loading = false.obs;

  getManagedArticles([String? userId]) async {
    print('userId: $userId');

    loading.value = true;

    var response =
        await DioService().getMethod('${ApiConstants.getMyArticles}1');

    articleList.clear();
    response.data
        .forEach((element) => articleList.add(ArticleModel.fromJson(element)));

    loading.value = false;

    log('myArticles: ${response.data}');
  }

  @override
  void onInit() {
    super.onInit();

    getManagedArticles();
  }
}
