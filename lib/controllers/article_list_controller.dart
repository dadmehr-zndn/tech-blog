import 'package:get/get.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class ArticleListController extends GetxController {
  RxList<ArticleModel> articlesList = RxList();

  getArticlesList() async {
    var response = await DioService().getMethod(ApiConstants.getArticlesList);

    if (response.statusCode == 200) {
      response.data.forEach(
        (element) => articlesList.add(
          ArticleModel.fromJson(element),
        ),
      );
    }
  }

  getArticlesListByTagId(String id) async {
    articlesList.clear();

    var response = await DioService().getMethod(
        '${ApiConstants.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=1');

    if (response.statusCode == 200) {
      response.data.forEach(
        (element) => articlesList.add(
          ArticleModel.fromJson(element),
        ),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();

    getArticlesList();
  }
}
