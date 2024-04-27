import 'dart:convert';

import 'package:get/get.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/models/home_poster_model.dart';
import 'package:tech_blog/models/home_tag_model.dart';
import 'package:tech_blog/models/home_top_articles_model.dart';
import 'package:tech_blog/models/home_top_podcasts_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  late Rx<HomePosterModel> poster;
  RxList<HomeTopArticlesModel> topArticlesList = RxList<HomeTopArticlesModel>();
  RxList<HomeTopPodcastsModel> topPodcastsList = RxList<HomeTopPodcastsModel>();
  RxList<HomeTagsModel> tagsList = RxList<HomeTagsModel>();

  getHomeItems() async {
    var response = await DioService().getMethod(ApiConstants.getHomeItems);

    //TODO: check here
    int counter = 0;
    if (response.statusCode == 200) {
      response.data['top_visited'].forEach(
        (element) {
          if (counter > response.data['top_visited'].lenght) return;
          topArticlesList.add(
            HomeTopArticlesModel.fromJson(element),
          );

          counter++;
        },
      );
    }
  }

  @override
  void onInit() {
    super.onInit();

    getHomeItems();
  }
}
