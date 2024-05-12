import 'package:get/get.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class ArticleListController extends GetxController {
  RxList<ArticleModel> articlesList = RxList();
  RxBool loading = false.obs;

  getArticlesList() async {
    loading.value = true;

    var response = await DioService().getMethod(ApiConstants.getArticlesList);

    if (response.statusCode == 200) {
      response.data.forEach(
        (element) => articlesList.add(
          ArticleModel.fromJson(element),
        ),
      );
    }

    loading.value = false;
  }

  getArticlesListByTagId(String id) async {
    loading.value = true;

    articlesList.clear();

    var response = await DioService().getMethod(
        '${ApiConstants.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=1');

    if (response.statusCode == 200) {
      response.data.forEach(
        (element) {
          if (element['author'] != null) {
            articlesList.add(
              ArticleModel.fromJson(element),
            );
          }
        },
      );
    }

    loading.value = false;
  }

  @override
  void onInit() {
    super.onInit();

    getArticlesList();
  }
}
