//TODO: uncomment
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/constants/dimens.dart';
import 'package:tech_blog/constants/storage.dart';
import 'package:tech_blog/controllers/article/article_list_controller.dart';
import 'package:tech_blog/controllers/register_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/views/main-screen/profile_screen.dart';
import 'package:tech_blog/views/register_welcome_screen.dart';
import 'home_screen.dart';
import '../../components/functions.dart';

enum Screen { home, profile }

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  RxInt selectedScreenIndex = 0.obs;
  final _scaffolKkey = GlobalKey<ScaffoldState>();

  ArticleListController articleListController =
      Get.put(ArticleListController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var hastagPadding = size.width / 28.72;
    // var blogPostHeight = size.height / 4.37;
    var blogPostHeight = size.height / 4;
    var podcastPostHeight = size.height / 4.2;

    return Scaffold(
      key: _scaffolKkey,
      drawer: Drawer(
        backgroundColor: SolidColors.drawer,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width / 9.74,
            vertical: size.height / 13.92,
          ),
          child: ListView(
            children: [
              // DrawerHeader(
              //   child: Center(
              //     child: Assets.images.logo.image(height: size.height / 9.17),
              //   ),
              // ),

              Center(
                child: Assets.images.logo.image(height: size.height / 9.17),
              ),
              SizedBox(height: size.height / 9.33),
              Divider(
                color: SolidColors.divideHorizontalLine,
                thickness: 0.5,
              ),
              ListTile(
                onTap: () {
                  _scaffolKkey.currentState!.closeDrawer();
                  selectedScreenIndex.value = 2;
                },
                splashColor: SolidColors.clickSplashColor,
                title: Text(
                  Strings.userProfile,
                  style: TextStyle(
                      color: SolidColors.drawerMenuTitle, fontSize: 12.5),
                ),
              ),
              Divider(
                color: SolidColors.divideHorizontalLine,
                thickness: 0.5,
              ),
              ListTile(
                onTap: () => launchMyUrl(Strings.aboutTechblogUrl),
                splashColor: SolidColors.clickSplashColor,
                title: Text(
                  Strings.aboutTechBlog,
                  style: TextStyle(
                      color: SolidColors.drawerMenuTitle, fontSize: 12.5),
                ),
              ),
              Divider(
                color: SolidColors.divideHorizontalLine,
                thickness: 0.5,
              ),
              ListTile(
                onTap: () async =>
                    await Share.share(Strings.shareTechblogDialog),
                splashColor: SolidColors.clickSplashColor,
                title: Text(
                  Strings.sharingTechBlog,
                  style: TextStyle(
                      color: SolidColors.drawerMenuTitle, fontSize: 12.5),
                ),
              ),
              Divider(
                color: SolidColors.divideHorizontalLine,
                thickness: 0.5,
              ),
              ListTile(
                onTap: () => launchMyUrl(Strings.techblogGithubUrl),
                splashColor: SolidColors.clickSplashColor,
                title: Text(
                  Strings.techBlogOnGithub,
                  style: TextStyle(
                      color: SolidColors.drawerMenuTitle, fontSize: 12.5),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        backgroundColor: SolidColors.appbar,
        title: Padding(
          padding: EdgeInsets.fromLTRB(
            Dimens.sidePaddings,
            size.height / 30.6,
            Dimens.sidePaddings,
            size.height / 29.28,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => _scaffolKkey.currentState!.openDrawer(),
                child: Icon(
                  Icons.menu,
                  size: size.width / 17,
                ),
              ),
              Assets.images.logo.image(height: size.height / 13.63),
              Transform.scale(
                scaleX: -1,
                child: IconButton(
                  //TODO: working as a logout, change it later
                  onPressed: () => Storage.clearStorage(),
                  icon: Icon(
                    Icons.search,
                    size: size.width / 17,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Obx(
              () => IndexedStack(
                index: selectedScreenIndex.value,
                children: [
                  HomeScreen(
                    size: size,
                    sidePaddings: Dimens.sidePaddings,
                    textTheme: textTheme,
                    hastagPadding: hastagPadding,
                    blogPostHeight: blogPostHeight,
                    podcastPostHeight: podcastPostHeight,
                  ),
                  RegisterWelcomeScreen(),
                  ProfileScreen(
                    size: size,
                    sidePaddings: Dimens.sidePaddings,
                    textTheme: textTheme,
                    hastagPadding: hastagPadding,
                    blogPostHeight: blogPostHeight,
                    podcastPostHeight: podcastPostHeight,
                  ),
                ],
              ),
            ),
          ),

          // Bottom Navigation Bar
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: BottomNavigationBar(
              size: size,
              changeScreen: (int index) => selectedScreenIndex.value = index,
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({
    super.key,
    required this.size,
    required this.changeScreen,
  });

  final Size size;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 5.89,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: GradientColors.navigationBarBackground,
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0, 0.4, 1],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: size.height / 14),
        child: Center(
          child: Container(
            height: size.height / 12.41,
            width: size.width / 1.36,
            decoration: Decorations.mainGradientBoxDecoration,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => changeScreen(0),
                    child: ImageIcon(
                      Assets.icons.home.image().image,
                      color: SolidColors.icon,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.find<RegisterController>().checkUserLoginStatus();
                    },
                    child: ImageIcon(
                      Assets.icons.feather.image().image,
                      color: SolidColors.icon,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => changeScreen(2),
                    child: ImageIcon(
                      Assets.icons.user.image().image,
                      color: SolidColors.icon,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
