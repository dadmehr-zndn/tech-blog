//TODO: uncomment
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/views/register_successful_screen.dart';
import 'package:validators/validators.dart';

class RegisterWelcomeScreen extends StatelessWidget {
  const RegisterWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // techBot Image
              SvgPicture.asset(
                Assets.images.techBot.path,
                height: size.height / 6.08,
              ),

              SizedBox(height: size.height / 32.44),

              // Welcome Text
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: Strings.welcomeToTechBlog,
                  style: textTheme.headline4,
                ),
              ),

              SizedBox(height: size.height / 7.16),

              // Button "Let's go"
              ElevatedButton(
                onPressed: () {
                  // Display Email BottomSheet
                  _showRegisterScreenBottomSheet(
                    context,
                    size,
                    textTheme,
                    headerText: Strings.plsEnterYourEmail,
                    hintText: Strings.techBlogEmail,
                    onPressed: () {
                      Navigator.pop(context);

                      //Display Code BottomSheet
                      _showRegisterScreenBottomSheet(
                        context,
                        size,
                        textTheme,
                        headerText: Strings.enterTheActivationCode,
                        hintText: Strings.codeTextHint,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterSuccessfulScreen(),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                child: Text(Strings.buttonLetsGo, style: textTheme.button),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showRegisterScreenBottomSheet(
    BuildContext context,
    Size size,
    TextTheme textTheme, {
    required String headerText,
    required String hintText,
    required Function() onPressed,
  }) {
    return showModalBottomSheet(
      barrierColor: SolidColors.pageBackgroundOverlay,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2.57,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                //TODO: check for the exact radius
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // لطفا ایمیلت را وارد کن
                  Text(
                    headerText,
                    style: textTheme.bodyText1,
                  ),

                  SizedBox(height: size.height / 33.81),

                  // Email TextField
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width / 5.7),
                    child: SizedBox(
                      height: size.height / 17,
                      child: TextField(
                        onChanged: (value) {
                          if (isEmail(value)) {
                            print(value);
                          }
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 0.0),
                          hintText: hintText,
                          hintStyle: textTheme.subtitle2,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: size.height / 16.08),

                  // Button Continue
                  ElevatedButton(
                    onPressed: onPressed,
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
      },
    );
  }
}
