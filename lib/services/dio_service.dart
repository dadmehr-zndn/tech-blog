import 'dart:developer';

import 'package:dio/dio.dart';

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
    });
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers['content-type'] = 'application/json';

    return await dio
        .post(
      url,
      data: FormData.fromMap(map),
      options: Options(
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
