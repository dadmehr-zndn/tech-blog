import 'dart:developer';

import 'package:get_storage/get_storage.dart';

class Storage {
  static String token = 'token';
  static String userId = 'userId';

  //TODO: delete the method
  static clearStorage() {
    GetStorage().write(token, 'token');
    GetStorage().write(userId, 'userId');
    log('token: $token\nuser_id: $userId', name: 'storage');
  }
}
