import 'package:get/get.dart';
import 'package:tech_blog/constants/api_constants.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/article_single_model.dart';
import 'package:tech_blog/models/home_tag_model.dart';
import 'package:tech_blog/services/dio_service.dart';
import 'package:tech_blog/views/article_single_screen.dart';

class ArticleSingleController extends GetxController {
  Rx<ArticleSingleModel> articleSingleModel = ArticleSingleModel().obs;
  RxList<TagModel> articleTags = RxList();
  RxList<ArticleModel> relatedArticles = RxList();
  RxString id = RxString('');

  RxBool loading = RxBool(false);

  getArticleInfo() async {
    print('id: $id');
    loading.value = true;

    var response =
        await DioService().getMethod('${ApiConstants.getArticleInfo}$id');

    if (response.statusCode == 200) {
      articleSingleModel.value = ArticleSingleModel.fromJson(response.data);

      // first we clear the list, because tags are just going add one by one
      articleTags.clear();
      response.data['tags'].forEach((element) {
        articleTags.add(
          TagModel.fromJson(element),
        );
      });

      relatedArticles.clear();
      response.data['related'].forEach(
        (element) {
          //* if we don't check status here our list gonna be red because of some null values
          if (element['status'] == '1') {
            relatedArticles.add(
              ArticleModel.fromJson(element),
            );
          }
        },
      );

      loading.value = false;
    }

    Get.to(ArticleSingleScreen());
  }

  // @override
  // void onInit() {
  //   super.onInit();

  //   getArticleInfo();
  // }
}
