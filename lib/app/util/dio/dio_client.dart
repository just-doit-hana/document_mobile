import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../model/app_reponse.dart';
import '../util.dart';

part './app_interceptors.dart';

class DioClient {
  static DioClient? singleton;

  final Dio dio = createDioClient();
  DioClient._internal();
  factory DioClient() {
    return singleton ??= DioClient._internal();
  }
  static Dio createDioClient() {
    final dio = Dio(BaseOptions(
        baseUrl: AppConstant.baseUrl,
        receiveTimeout: 15000,
        connectTimeout: 1500,
        sendTimeout: 1500,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          HttpHeaders.authorizationHeader: 'bearer'
        }));
    dio.interceptors.addAll([
      AppInterceptors(),
      if (AppConstant.DIO_CLIENT_DEBUG_LOG)
        PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: true,
            error: true,
            compact: true,
            maxWidth: 90)
    ]);

    return dio;
  }
}
