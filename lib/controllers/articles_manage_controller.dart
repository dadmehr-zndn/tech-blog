import 'dart:developer';

import 'package:get/get.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class ArticlesManageController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();

  getManagedArticles(String userId) async {
    print('userId: $userId');

    var response =
        await DioService().getMethod('${ApiConstants.getMyArticles}3');

    log('myArticles: ${response.data}');
  }
}
