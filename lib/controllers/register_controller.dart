//TODO: uncomment
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/components/main_screen_bottom_sheet.dart';
import 'package:tech_blog/constants/constants.dart';
import 'package:tech_blog/constants/storage.dart';
import 'package:tech_blog/routes/app_pages.dart';
import 'package:tech_blog/themes/text_styles.dart';
import 'package:tech_blog/services/dio_service.dart';
import 'package:tech_blog/views/register_successful_screen.dart';

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
        MainScreenBottomSheet(),
      );
    }
  }
}
