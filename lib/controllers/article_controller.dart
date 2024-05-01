import 'package:get/get.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/models/home_top_articles_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class ArticleController extends GetxController {
  RxList<HomeTopArticlesModel> articlesList = RxList();

  getArticlesList() async {
    var response = await DioService().getMethod(ApiConstants.getArticlesList);

    if (response.statusCode == 200) {
      response.data.forEach(
        (element) => articlesList.add(
          HomeTopArticlesModel.fromJson(element),
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
