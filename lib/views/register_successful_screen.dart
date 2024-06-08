//TODO: uncomment
// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/hashtag.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/controllers/home_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/home_tag_model.dart';
import 'package:tech_blog/models/models.dart';
import 'package:tech_blog/routes/app_pages.dart';

class RegisterSuccessfulScreen extends StatefulWidget {
  const RegisterSuccessfulScreen({super.key});

  @override
  State<RegisterSuccessfulScreen> createState() =>
      _RegisterSuccessfulScreenState();
}

class _RegisterSuccessfulScreenState extends State<RegisterSuccessfulScreen> {
  final _listViewController = ScrollController();
  TagModel? _selectedTwice;

  // var tagController = Get.find<HomeScreenController>().tagsList;
  var tagController = Get.put(HomeScreenController()).tagsList;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width / 10.6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image techBot
              SvgPicture.asset(
                Assets.images.techBot.path,
                height: size.height / 6.08,
              ),

              SizedBox(height: size.height / 39.31),

              // Success Dialog
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: Strings.congratsEmailSuccess,
                  style: textTheme.headline2!.copyWith(
                    color: SolidColors.primaryColor,
                  ),
                ),
              ),

              SizedBox(height: size.height / 16.16),

              // Choose Categories Text
              Text(
                Strings.chooseTheCategoryLike,
                style: textTheme.headline2!.copyWith(
                  color: SolidColors.primaryColor,
                ),
              ),

              SizedBox(height: size.height / 28.05),

              // Categories Hashtags
              SizedBox(
                height: size.height / 9.68,
                child: MasonryGridView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: tagController.length,
                  mainAxisSpacing: size.width / 18.75,
                  crossAxisSpacing: size.height / 65.46,
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (!hashTagsCategoriesSelected
                            .contains(tagController[index])) {
                          setState(() {
                            /// I used Set in fake_data.dart to manage preventing of duplicate tags selected
                            hashTagsCategoriesSelected
                                .add(tagController[index]);
                          });

                          /// Here I'm moving to the end of the list only if the item is not already in it
                          if (_listViewController.hasClients) {
                            final position =
                                _listViewController.position.maxScrollExtent;
                            _listViewController.animateTo(
                              position + hashTagsList[index].title.length + 120,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeIn,
                            );
                          }
                        } else {
                          /// Check if the tag already selected make it red for 1 second
                          setState(() {
                            _selectedTwice = tagController[index];
                          });

                          Future.delayed(
                            const Duration(seconds: 1),
                            () => setState(() {
                              _selectedTwice = null;
                            }),
                          );
                        }
                        // Shaking the Selected Container Tag to Warn the user it already exists
                      },
                      child: Hashtag(
                        size: size,
                        textTheme: textTheme,
                        index: index,
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: size.height / 31.91),

              // Down Arrow image
              Assets.images.downArrow.image(height: size.height / 16.66),

              SizedBox(height: size.height / 18.26),

              // Selected Categories
              SizedBox(
                height: size.height / 22.57,
                child: ListView.builder(
                  controller: _listViewController,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: hashTagsCategoriesSelected.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          right: index == 0 ? 0 : size.width / 21.87),
                      child: GestureDetector(
                        onTap: () => setState(
                          () => hashTagsCategoriesSelected.remove(
                            hashTagsCategoriesSelected.elementAt(index),
                          ),
                        ),
                        child: AnimatedContainer(
                          duration: Duration(microseconds: 300),
                          decoration: BoxDecoration(
                            color: _selectedTwice ==
                                    hashTagsCategoriesSelected.elementAt(index)
                                ? Colors.red.withOpacity(0.7)
                                : SolidColors.surface,
                            //TODO: exact radius
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width / 20),
                              child: Text(
                                hashTagsCategoriesSelected
                                    .elementAt(index)
                                    .title!,
                                style: textTheme.headline4!.copyWith(
                                  color: SolidColors.textLabelTagInside,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: size.height / 13.81),

              ElevatedButton(
                onPressed: () {
                  //TODO: must change here
                  Get.offAndToNamed(Routes.main);
                },
                child: Text(
                  Strings.buttonContinue,
                  style: textTheme.button,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
