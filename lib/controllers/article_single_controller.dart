import 'package:get/get.dart';
import 'package:tech_blog/constants/api_constants.dart';
import 'package:tech_blog/models/article_single_model.dart';
import 'package:tech_blog/models/home_tag_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class ArticleSingleController extends GetxController {
  Rx<ArticleSingleModel> articleSingleModel = Rx(ArticleSingleModel());
  RxList<TagModel> articleTags = RxList();
  RxString id = RxString('');

  RxBool loading = RxBool(false);

  getArticleInfo() async {
    print('id: $id');
    loading.value = true;

    var response =
        await DioService().getMethod('${ApiConstants.getArticleInfo}$id');

    if (response.statusCode == 200) {
      articleSingleModel =
          ArticleSingleModel.fromJson(response.data['info']).obs;

      response.data['tags'].forEach(
        (element) => articleTags.add(
          TagModel.fromJson(element),
        ),
      );

      loading.value = false;
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();

  //   getArticleInfo();
  // }
}
