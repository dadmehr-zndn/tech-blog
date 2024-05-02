import 'package:get/get.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/models/hashtag_model.dart';
import 'package:tech_blog/models/home_poster_model.dart';
import 'package:tech_blog/models/home_tag_model.dart';
import 'package:tech_blog/models/home_top_articles_model.dart';
import 'package:tech_blog/models/home_top_podcasts_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  Rx<HomePosterModel> homePoster = HomePosterModel().obs;
  RxList<HomeTopArticlesModel> topArticlesList = RxList<HomeTopArticlesModel>();
  RxList<HomeTopPodcastsModel> topPodcastsList = RxList<HomeTopPodcastsModel>();
  RxList<TagModel> tagsList = RxList<TagModel>();

  RxBool loading = RxBool(false);

  getHomeItems() async {
    loading.value = true;

    // * This await is too important
    var response = await DioService().getMethod(ApiConstants.getHomeItems);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach(
        (element) {
          topArticlesList.add(
            HomeTopArticlesModel.fromJson(element),
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
  }

  @override
  void onInit() {
    super.onInit();

    getHomeItems();
  }
}
