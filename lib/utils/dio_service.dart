import 'package:dio/dio.dart';
import 'package:kstream/utils/dio_logging.dart';

import '../constants/constants.dart';

class DioService {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: kBaseUrl,
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/form-data',
      },
    ),
  )..interceptors.add(DioLogging());

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer',
      'Content-Type': 'application/json',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer',
      'Accept': 'application/json',
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  Future<Response> postDataWithImage({
    required String url,
    required FormData data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer',
      'Accept': 'application/json',
      'Content-Type': 'application/form-data',
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  Future<Response> patchData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer',
      'Content-Type': 'application/form-data',
    };
    return await dio.patch(
      url,
      queryParameters: query,
      data: data,
    );
  }

  Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer',
      'Content-Type': 'application/form-data',
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
