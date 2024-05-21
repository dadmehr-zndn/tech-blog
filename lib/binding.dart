import 'package:get/get.dart';
import 'package:tech_blog/controllers/article/article_list_controller.dart';
import 'package:tech_blog/controllers/article/article_single_controller.dart';
import 'package:tech_blog/controllers/home_screen_controller.dart';
import 'package:tech_blog/controllers/podcast/podcasts_list_controller.dart';
import 'package:tech_blog/controllers/register_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ArticleListController());
    Get.lazyPut(() => ArticleSingleController());
  }
}

class ArticlesManageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticlesManageBinding());
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController());
  }
}

class PodcastBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PodcastsListController());
  }
}
