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
        connectTimeout: AppConstant.connectionTimeout,
        receiveTimeout: AppConstant.receiveTimeout,
        responseType: ResponseType.json,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          HttpHeaders.authorizationHeader:
              // 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiIxN2EwMGQ1ZC1hMWVlLTQzNjAtYWJlNy1kYTM5NTYxMTQyNGUiLCJFbWFpbCI6ImJhb25ndXllbmNvbmcxMzk5QGdtYWlsLmNvbSIsIkZpcnN0TmFtZSI6Ik5ndXnhu4VuIEPDtG5nIiwiTGFzdE5hbWUiOiJC4bqjbyIsIlVzZXJOYW1lIjoiYmFvIiwiRGVwYXJ0bWVudElkIjoiMzY2IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjpbIlRyYWluZWUiLCJJbnN0cnVjdHVyZSIsIlRBVCIsIklUIl0sIk1vZHVsZXMiOlsiVEVTVCBLIERPTkcgQk8iLCJMSUJSQVJZIiwiTE1TIiwiVEFTSyBNQU5BR0VSIiwiRE9DVU1FTlQiLCJBU1NFVCIsIkhBSEFIQUhBSEEiLCJJVCBBU1NFVCJdLCJQaG9uZU51bWJlciI6IjA5MTk3Mjc3NzUiLCJleHAiOjE2Njg0MTcwNDAsImlzcyI6IlZpZXRKZXRfQXBpR2F0ZXdheSIsImF1ZCI6IlZpZXRKZXRfQXBpR2F0ZXdheSJ9.hYBIBIKn3gX0WTLv2-eTMn8ZdcleN37nVeCqma83ltw'
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiIwMGMxODUyZi1lZjAwLTRkNmYtYTA3Yi1jNzNkMmRlMTVhNzgiLCJFbWFpbCI6Im5naGlhcHRAaGlzb2Z0LnZuIiwiRmlyc3ROYW1lIjoiTmdoxKlhIiwiTGFzdE5hbWUiOiJQaOG6oW0gVHLhu41uZyIsIlVzZXJOYW1lIjoiYWQiLCJEZXBhcnRtZW50SWQiOiIzNjYiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJBZG1pbiIsIk1vZHVsZXMiOlsiVEVTVCBLIERPTkcgQk8iLCJBU1NFVCIsIkxJQlJBUlkiLCJMTVMiLCJET0NVTUVOVCIsIlRBU0sgTUFOQUdFUiIsIklUIEFTU0VUIl0sIlBob25lTnVtYmVyIjoiMDEyMzQ1Njc4OSIsImV4cCI6MTY2ODQ4NzQxMSwiaXNzIjoiVmlldEpldF9BcGlHYXRld2F5IiwiYXVkIjoiVmlldEpldF9BcGlHYXRld2F5In0.J5GlUZt6cJm3Q7tiCcGvb4UL6lXguV0G9XUymFvCIOo'
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
