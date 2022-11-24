// ignore: file_names
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../util.dart';

class DioClient {
  // late final Dio _dio;
  // final shaedpref = SharedPreferenceHelper.instance;

  static DioClient? _singleton;
  final Dio dio = createDioClient();

  DioClient._internal();

  factory DioClient() {
    return _singleton ??= DioClient._internal();
  }

  static Dio createDioClient() {
    final dio = Dio(BaseOptions(
        // connectTimeout: AppConstant.connectionTimeout,
        receiveTimeout: AppConstant.receiveTimeout,
        responseType: ResponseType.json,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          HttpHeaders.authorizationHeader:
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiIwMGMxODUyZi1lZjAwLTRkNmYtYTA3Yi1jNzNkMmRlMTVhNzgiLCJFbWFpbCI6Im5naGlhcHRAaGlzb2Z0LnZuIiwiRmlyc3ROYW1lIjoiTmdoxKlhIiwiTGFzdE5hbWUiOiJQaOG6oW0gVHLhu41uZyIsIlVzZXJOYW1lIjoiYWQiLCJEZXBhcnRtZW50SWQiOiI1OSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkFkbWluIiwiTW9kdWxlcyI6WyJURVNUIEsgRE9ORyBCTyIsIkRPQ1VNRU5UIiwiSVQgQVNTRVQiLCJBU1NFVCIsIkxJQlJBUlkiLCJMTVMiLCJUQVNLIE1BTkFHRVIiXSwiUGhvbmVOdW1iZXIiOiIwMTIzNDU2Nzg5IiwiZXhwIjoxNjY5Mjc1MjI5LCJpc3MiOiJWaWV0SmV0X0FwaUdhdGV3YXkiLCJhdWQiOiJWaWV0SmV0X0FwaUdhdGV3YXkifQ.7NluwMWwQFWzePfxAAV9Ugo4wK98vDyrW4UkmnBlr8E'
        }));
    dio.interceptors.addAll([
      //  LoggerInterceptor(),
      //         AuthorizationInterceptor(),
      if (AppConstant.DIO_CLIENT_DEBUG_LOG)
        PrettyDioLogger(
            requestHeader: false,
            requestBody: false,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: false,
            maxWidth: 90)
    ]);

    // Future<UserInfor?> login(LoginUser loginUser) async {
    //   try {
    //     final res = await _dio.post("https://docgatewayapi.hisoft.vn/auth/login",
    //         data: loginUser.toJson());
    //     UserInfor userInfor = UserInfor.fromJson(res.data);
    //     if (kDebugMode) {
    //       print('UserTest ${userInfor.dmsToken}');
    //     }
    //     // if (res.statusCode == 200) {
    //     //   shaedpref.setString("dmsToken", '${userInfor.dmsToken}');
    //     // }
    //     return userInfor;
    //   } on DioError catch (e) {
    //     final errorMessage = DiorException.fromDioError(e).toString();
    //     throw errorMessage;
    //   } catch (e) {
    //     if (kDebugMode) {
    //       print(e);
    //     }
    //     // throw e.toString();
    //   }
    //   return null;
    return dio;
  }
}
