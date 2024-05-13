import 'package:get/get.dart';
import 'package:tech_blog/binding.dart';
import 'package:tech_blog/views/article_single_screen.dart';
import 'package:tech_blog/views/articles_list_screen.dart';
import 'package:tech_blog/views/main-screen/main_screen.dart';
import 'package:tech_blog/views/register_successful_screen.dart';
import 'package:tech_blog/views/register_welcome_screen.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.main,
      page: () => const MainScreen(),
      bindings: [
        RegisterBinding(),
        ArticleBinding(),
      ],
    ),
    GetPage(name: Routes.articlesList, page: () => const ArticlesListScreen()),
    GetPage(name: Routes.articleSingle, page: () => ArticleSingleScreen()),
    GetPage(name: Routes.registerWelcome, page: () => RegisterWelcomeScreen()),
    GetPage(
        name: Routes.registerSuccessful,
        page: () => const RegisterSuccessfulScreen()),
  ];
}
