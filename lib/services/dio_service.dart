import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/constants/storage.dart';
import 'package:validators/validators.dart';

class DioService {
  Dio dio = Dio();

  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-type'] = 'application/json';

    return await dio
        .get(
      url,
      options: Options(
        responseType: ResponseType.json,
        method: 'GET',
      ),
    )
        .then((response) {
      return response;
      //TODO: here
      // ignore: body_might_complete_normally_catch_error
    }).catchError((err) {
      if (err is DioException) {
        //TODO: handle the error properly
        /// extracting status code
        log('dioooo');
        var errMessageList = err.message!.split(' ');
        var statusCode = '';

        for (var element in errMessageList) {
          if (isNumeric(element)) {
            statusCode = element;
          }
        }
        print('statusCode: $statusCode');
        throw Exception(statusCode);
      }
    });
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers['content-type'] = 'application/json';

    var token = GetStorage().read(Storage.token);
    if (token != null) {
      dio.options.headers['authorization'] = token;
    }

    return await dio
        .post(
      url,
      data: FormData.fromMap(map),
      options: Options(
        // Changed this part to plain
        responseType: ResponseType.json,
        method: 'POST',
      ),
    )
        .then(
      (response) {
        log('headers: ${response.headers}');
        log('data: ${response.data}');
        log('statusCode: ${response.statusCode}');

        return response;
      },
    );
  }
}
