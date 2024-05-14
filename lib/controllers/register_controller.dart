//TODO: uncomment
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/constants/api_constants.dart';
import 'package:tech_blog/constants/colors.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/constants/storage.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/routes/app_pages.dart';
import 'package:tech_blog/themes/text_styles.dart';
import 'package:tech_blog/services/dio_service.dart';
import 'package:tech_blog/views/register_successful_screen.dart';
import 'package:tech_blog/views/register_welcome_screen.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activationCodeTextEditingController =
      TextEditingController();

  var email = '';
  var userId = '';

  register() async {
    var map = {
      'email': emailTextEditingController.text,
      'command': 'register',
    };
    var response =
        await DioService().postMethod(map, ApiConstants.postRegisterEmail);

    //TODO: this section must delete
    print(response.data['user_id']);
    email = emailTextEditingController.text;
    userId = response.data['user_id'];
  }

  verify() async {
    var map = {
      'email': email,
      'user_id': userId,
      'code': activationCodeTextEditingController.text,
      'command': 'verify',
    };
    var response =
        await DioService().postMethod(map, ApiConstants.postRegisterEmail);

    //TODO: delete
    if (response.data['response'] == 'verified') {
      Get.back();

      var box = GetStorage();
      box.write(Storage.token, response.data['token']);
      box.write(Storage.userId, response.data['user_id']);
      Get.showSnackbar(
        GetSnackBar(
          duration: const Duration(seconds: 2),
          backgroundColor: SolidColors.primaryColor,
          icon: const Icon(
            Icons.check,
            color: Colors.green,
          ),
          messageText: Text(
            'ثبت‌نام با موفقیت انجام شد',
            style: snackbarSuccessTextStyle,
          ),
        ),
      );

      await Future.delayed(const Duration(seconds: 2));

      Get.offAll(const RegisterSuccessfulScreen());

      log(box.read(Storage.token), name: 'token');
      log(box.read(Storage.userId), name: 'user_id');
    } else {
      Get.showSnackbar(
        GetSnackBar(
          duration: const Duration(seconds: 2),
          backgroundColor: SolidColors.primaryColor,
          icon: const Icon(
            Icons.close,
            color: Colors.red,
          ),
          messageText: Text(
            'کد وارد شده اشتباه است',
            style: snackbarSuccessTextStyle,
          ),
        ),
      );
      print('Unverified');
    }
  }

  checkUserLoginStatus() {
    // not logged in yey
    if (GetStorage().read(Storage.token) == null ||
        GetStorage().read(Storage.token) == 'token') {
      Get.toNamed(Routes.registerWelcome);
      // already logged in
    } else {
      print('already logged in');
      Get.bottomSheet(
        backgroundColor: SolidColors.white,
        Container(
          height: Get.height / 3.27,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width / 15.08, vertical: Get.height / 27.64),
            child: Column(
              children: [
                // TITLE
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Assets.images.techBot.svg(height: Get.height / 15),
                    SizedBox(width: Get.width / 20.15),
                    Text(
                      Strings.shareYourKnowledgeWithOthers,
                      style: Get.textTheme.headline4,
                    ),
                  ],
                ),

                SizedBox(height: Get.height / 39.88),

                // BODY
                Text(
                  Strings.thinkBeingHereMeans,
                  style: mainScreenBottomSheetTextStyle,
                ),

                SizedBox(height: Get.height / 20),

                // BUTTONS, manage articles & podcasts
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // manage articles button
                    InkWell(
                      splashColor: SolidColors.clickSplashColor,
                      borderRadius: BorderRadius.circular(5),
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Assets.icons.manageArticles
                              .image(height: Get.height / 32),
                          SizedBox(width: Get.width / 25),
                          Text(
                            Strings.manageArticles,
                            style: mainScreenButtonsTextStyle,
                          ),
                        ],
                      ),
                    ),

                    // manage podcasts button
                    InkWell(
                      splashColor: SolidColors.clickSplashColor,
                      borderRadius: BorderRadius.circular(5),
                      onTap: () {},
                      child: Row(
                        children: [
                          Assets.icons.managePodcasts
                              .image(height: Get.height / 32),
                          SizedBox(width: Get.width / 25),
                          Text(
                            Strings.managePodcasts,
                            style: mainScreenButtonsTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
