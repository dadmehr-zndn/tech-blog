import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/constants/api_constants.dart';
import 'package:tech_blog/constants/storage.dart';
import 'package:tech_blog/services/dio_service.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activationCodeTextEditingController =
      TextEditingController();

  RxBool isVerified = false.obs;

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
      isVerified.value = true;

      var box = GetStorage();
      box.write(Storage.token, response.data['token']);
      box.write(Storage.userId, response.data['user_id']);

      log(box.read(Storage.token), name: 'token');
      log(box.read(Storage.userId), name: 'user_id');
    } else {
      print('Unverified');
    }
  }
}
