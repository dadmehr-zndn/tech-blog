import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/constants/commands.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/constants/storage.dart';
import 'package:tech_blog/controllers/file_picker_controller.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/article_single_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class ArticlesManageController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  Rx<ArticleSingleModel> articleSingleModel =
      ArticleSingleModel(image: '', content: Strings.iAmMainArticleBody).obs;
  TextEditingController articleTitleController = TextEditingController();
  var articleBodyController = '';
  RxBool loading = false.obs;
  RxBool isTitleEmpty = true.obs;

  getManagedArticles() async {
    loading.value = true;

    var userId = GetStorage().read(Storage.userId);
    print('userId: $userId');

    var response =
        await DioService().getMethod('${ApiConstants.getMyArticles}$userId');

    if (response.statusCode == 200) {
      articleList.clear();
      response.data.forEach(
          (element) => articleList.add(ArticleModel.fromJson(element)));

      loading.value = false;
    }

    log('myArticles: ${response.data}');
  }

  updateTitle() {
    articleSingleModel
        .update((val) => val!.title = articleTitleController.value.text);

    isTitleEmpty.value = false;
  }

  storeArticle() async {
    log('articleSingleModel: ${articleSingleModel.value.toString()}');
    log('userId: ${GetStorage().read(Storage.userId)}');
    var filePickerController = Get.find<FilePickerController>();

    Map<String, dynamic> map = {
      ApiPostArticleKeys.title: articleSingleModel.value.title,
      ApiPostArticleKeys.content: articleSingleModel.value.content,
      ApiPostArticleKeys.catId: articleSingleModel.value.catId,
      ApiPostArticleKeys.tagList: '[]',
      ApiPostArticleKeys.userId: GetStorage().read(Storage.userId),
      ApiPostArticleKeys.image: await dio.MultipartFile.fromFile(
          filePickerController.file.value.path!),
      ApiPostArticleKeys.command: Commands.store,
    };

    var response = await DioService().postMethod(map, ApiConstants.postArticle);

    log(response.data.toString());
  }

  // @override
  // void onInit() {
  //   super.onInit();

  //   getManagedArticles(GetStorage().read(Storage.userId));
  // }
}
