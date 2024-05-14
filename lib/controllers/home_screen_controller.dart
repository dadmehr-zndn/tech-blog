import 'package:get/get.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/home_poster_model.dart';
import 'package:tech_blog/models/home_tag_model.dart';
import 'package:tech_blog/models/home_top_podcasts_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  Rx<HomePosterModel> homePoster = HomePosterModel().obs;
  RxList<ArticleModel> topArticlesList = RxList<ArticleModel>();
  RxList<HomeTopPodcastsModel> topPodcastsList = RxList<HomeTopPodcastsModel>();
  RxList<TagModel> tagsList = RxList<TagModel>();

  RxBool loading = RxBool(false);

  getHomeItems() async {
    loading.value = true;

    // * This await is too important
    try {
      var response = await DioService().getMethod(ApiConstants.getHomeItems);

      if (response.statusCode == 200) {
        response.data['top_visited'].forEach(
          (element) {
            topArticlesList.add(
              ArticleModel.fromJson(element),
            );
          },
        );

        response.data['top_podcasts'].forEach(
          (element) {
            topPodcastsList.add(
              HomeTopPodcastsModel.fromJson(element),
            );
          },
        );

        response.data['tags'].forEach(
          (element) {
            tagsList.add(
              TagModel.fromJson(element),
            );
          },
        );

        homePoster.value = HomePosterModel.fromJson(response.data['poster']);

        loading.value = false;
      }
      //TODO: change the handling error system
    } catch (err) {
      Get.snackbar('خطا', err.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();

    getHomeItems();
  }
}
