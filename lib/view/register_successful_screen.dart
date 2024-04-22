//TODO: uncomment
// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/components/hashtag.dart';
import 'package:tech_blog/constants.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/models/hashtag_model.dart';
import 'package:tech_blog/models/models.dart';

class RegisterSuccessfulScreen extends StatefulWidget {
  const RegisterSuccessfulScreen({super.key});

  @override
  State<RegisterSuccessfulScreen> createState() =>
      _RegisterSuccessfulScreenState();
}

class _RegisterSuccessfulScreenState extends State<RegisterSuccessfulScreen> {
  final _listViewController = ScrollController();
  bool _isSelected = false;
  HashTagModel? _selectedTwice;

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
                  itemCount: hashTagsList.length,
                  mainAxisSpacing: size.width / 18.75,
                  crossAxisSpacing: size.height / 65.46,
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (!hashTagsCategoriesSelected
                            .contains(hashTagsList[index])) {
                          setState(() {
                            /// I used Set in fake_data.dart to manage preventing of duplicate tags selected
                            hashTagsCategoriesSelected.add(hashTagsList[index]);
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
                          setState(() {
                            _selectedTwice = hashTagsList[index];
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
                                    .title,
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
                  //TODO: implement
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
