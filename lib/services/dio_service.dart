import 'dart:developer';

import 'package:dio/dio.dart';

class DioService {
  Dio dio = Dio();

  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'Get'))
        .then((response) {
      log(response.toString());
      return response;
    });
  }

  Future<dynamic> postMethod(String url, Map<String, dynamic> map) async {
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .post(url,
            data: map,
            options: Options(responseType: ResponseType.json, method: 'Post'))
        .then((response) {
      log(response.toString());
      return response;
    });
  }
}
