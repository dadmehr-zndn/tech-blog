import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/models/models.dart';
import 'package:tech_blog/services/dio_service.dart';

class PodcastsListController extends GetxController {
  RxList<PodcastModel> podcastsList = RxList.empty();
  RxBool isLoading = false.obs;

  getPodcasts() async {
    isLoading.value = true;
    var response = await DioService().getMethod(ApiConstants.getPodcastsList);

    if (response.statusCode == 200) {
      response.data.forEach(
          (element) => podcastsList.add(PodcastModel.fromJson(element)));

      log('getPodcastsList: ${response.data}');
      podcastsList.forEach((element) => print(element.poster));
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();

    getPodcasts();
  }
}
