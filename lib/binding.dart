import 'package:get/get.dart';
import 'package:tech_blog/controllers/article_list_controller.dart';
import 'package:tech_blog/controllers/article_single_controller.dart';
import 'package:tech_blog/controllers/register_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ArticleListController());
    Get.lazyPut(() => ArticleSingleController());
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
