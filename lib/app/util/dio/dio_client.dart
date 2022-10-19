// ignore: file_names
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:document_appmobile/app/util/dio/dio_exception.dart';
import 'package:document_appmobile/app/util/dio/dior_authorization_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../util.dart';
import '../../../src/data/model/user_test.dart';

class DioClient {
  late final Dio _dio;
  DioClient()
      : _dio = Dio(BaseOptions(
            // baseUrl: 'https://gorest.co.in/public/v2',
            connectTimeout: AppConstant.connectionTimeout,
            receiveTimeout: AppConstant.receiveTimeout,
            responseType: ResponseType.json,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
              // HttpHeaders.authorizationHeader: 'bearer'
            }))
          ..interceptors.addAll([
            // LoggerInterceptor(),
            AuthorizationInterceptor(),
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

  // Future<User?> getUser({required int id}) async {
  //   try {
  //     final res = await _dio.get("/users/$id");
  //     print('Res ${res.data}');
  //     return User.fromJson(res.data);
  //   } on DioError catch (e) {
  //     final errorMessage = DiorException.fromDioError(e).toString();
  //     throw errorMessage;
  //   } catch (e) {
  //     print(e);
  //     throw e.toString();
  //   }
  // }
}
