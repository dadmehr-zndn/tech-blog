import 'package:get/get.dart';
import 'package:tech_blog/constants/api_constants.dart';
import 'package:tech_blog/models/article_single_model.dart';
import 'package:tech_blog/models/home_tag_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class ArticleSingleController extends GetxController {
  Rx<ArticleSingleModel> articleSingleModel = Rx(ArticleSingleModel());
  RxList<TagModel> articleTags = RxList();

  RxBool loading = RxBool(false);

  getArticleInfo() async {
    loading.value = true;

    var response =
        await DioService().getMethod('${ApiConstants.getArticleInfo}3');

    if (response.statusCode == 200) {
      articleSingleModel =
          ArticleSingleModel.fromJson(response.data['info']).obs;

      response.data['tags'].forEach(
        (element) => articleTags.add(
          TagModel.fromJson(element),
        ),
      );

      print(response.statusCode);
      print(response.data['info']);
      print(response.data['tags']);

      loading.value = false;
    }
    print(response.statusCode);
  }

  @override
  void onInit() {
    super.onInit();

    getArticleInfo();
  }
}
