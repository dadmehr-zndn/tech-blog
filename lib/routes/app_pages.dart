import 'package:get/get.dart';
import 'package:tech_blog/binding.dart';
import 'package:tech_blog/views/article/article_editting_screen.dart';
import 'package:tech_blog/views/article/article_single_screen.dart';
import 'package:tech_blog/views/article/articles_list_screen.dart';
import 'package:tech_blog/views/article/articles_managed_screen.dart';
import 'package:tech_blog/views/main-screen/main_screen.dart';
import 'package:tech_blog/views/podcast/podcast_single_screen.dart';
import 'package:tech_blog/views/podcast/podcasts_list_screen.dart';
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
    GetPage(
      name: Routes.registerWelcome,
      page: () => RegisterWelcomeScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.registerSuccessful,
      page: () => const RegisterSuccessfulScreen(),
    ),
    GetPage(
      name: Routes.articlesManaged,
      page: () => ArticlesManagedScreen(),
      binding: ArticlesManageBinding(),
    ),
    GetPage(
      name: Routes.articleEditting,
      page: () => ArticleEdittingScreen(),
      binding: ArticlesManageBinding(),
    ),
    GetPage(
      name: Routes.podcastsList,
      page: () => PodcastsListScreen(),
      binding: PodcastBinding(),
    ),
    GetPage(
      name: Routes.podcastSingle,
      page: () => PodcastSingleScreen(),
    ),
  ];
}
