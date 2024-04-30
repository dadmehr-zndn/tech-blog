import 'dart:convert';

import 'package:get/get.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/models/home_poster_model.dart';
import 'package:tech_blog/models/home_tag_model.dart';
import 'package:tech_blog/models/home_top_articles_model.dart';
import 'package:tech_blog/models/home_top_podcasts_model.dart';
import 'package:tech_blog/services/dio_service.dart';
import 'package:tech_blog/views/home_screen.dart';

class HomeScreenController extends GetxController {
  late Rx<HomePosterModel> homePoster;
  RxList<HomeTopArticlesModel> topArticlesList = RxList<HomeTopArticlesModel>();
  RxList<HomeTopPodcastsModel> topPodcastsList = RxList<HomeTopPodcastsModel>();
  RxList<HomeTagsModel> tagsList = RxList<HomeTagsModel>();

  getHomeItems() async {
    // * This await is too important
    var response = await DioService().getMethod(ApiConstants.getHomeItems);

    //TODO: check here
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

      homePoster = HomePosterModel.fromJson(response.data['poster']).obs;
    }
  }

  @override
  void onInit() {
    super.onInit();

    getHomeItems();
  }
}
