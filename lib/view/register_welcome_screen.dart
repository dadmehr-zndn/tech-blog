//TODO: uncomment
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/constants.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class RegisterWelcomeScreen extends StatelessWidget {
  const RegisterWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return SizedBox(
      child: Scaffold(
        body: Center(
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
                  //TODO: delete
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: SolidColors.primaryColor,
                      content: Text(
                        'خوشگل فعلا تا همینجا پیش رفتیم 😂🙈',
                        style: textTheme.headline1!.copyWith(fontSize: 15),
                      ),
                    ),
                  );
                },
                child: Text(
                  Strings.buttonLetsGo,
                  style: textTheme.headline4!.copyWith(
                    color: SolidColors.buttonTextColor,
                    fontSize: 14,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return SolidColors.primaryColor.withOpacity(0.7);
                    }
                    return SolidColors.primaryColor;
                  }),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      //TODO: exact Radius
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
