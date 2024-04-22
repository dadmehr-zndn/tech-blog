//TODO: uncomment
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tech_blog/components/profile_divider.dart';
import 'package:tech_blog/constants.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/view/profile_screen.dart';
import 'package:tech_blog/view/register_welcome_screen.dart';
import 'home_screen.dart';

enum Screen { home, profile }

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = 0;
  final _scaffolKkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var sidePaddings = size.width / 12.53;
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
                onTap: () {},
                splashColor: SolidColors.primaryColor.withOpacity(0.1),
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
                onTap: () {},
                splashColor: SolidColors.primaryColor.withOpacity(0.1),
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
                onTap: () {},
                splashColor: SolidColors.primaryColor.withOpacity(0.1),
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
                onTap: () {},
                splashColor: SolidColors.primaryColor.withOpacity(0.1),
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
            sidePaddings,
            size.height / 30.6,
            sidePaddings,
            size.height / 29.28,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => _scaffolKkey.currentState!.openDrawer(),
                icon: Icon(
                  Icons.menu,
                  size: size.width / 17,
                ),
              ),
              Assets.images.logo.image(height: size.height / 13.63),
              Transform.scale(
                scaleX: -1,
                child: Icon(
                  Icons.search,
                  size: size.width / 17,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: IndexedStack(
              index: selectedScreenIndex,
              children: [
                HomeScreen(
                  size: size,
                  sidePaddings: sidePaddings,
                  textTheme: textTheme,
                  hastagPadding: hastagPadding,
                  blogPostHeight: blogPostHeight,
                  podcastPostHeight: podcastPostHeight,
                ),
                RegisterWelcomeScreen(),
                ProfileScreen(
                  size: size,
                  sidePaddings: sidePaddings,
                  textTheme: textTheme,
                  hastagPadding: hastagPadding,
                  blogPostHeight: blogPostHeight,
                  podcastPostHeight: podcastPostHeight,
                ),
              ],
            ),
          ),

          // Bottom Navigation Bar
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: BottomNavigationBar(
                size: size,
                changeScreen: (int index) {
                  if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterWelcomeScreen(),
                      ),
                    );
                  }
                  setState(() => selectedScreenIndex = index);
                }),
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
            decoration: BoxDecoration(
              //TODO: check for the exact redius
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(colors: GradientColors.bottomNavigation),
            ),
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
                    onTap: () => changeScreen(1),
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
