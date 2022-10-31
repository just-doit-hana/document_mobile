// ignore: file_names
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:document_appmobile/app/helper/shared_preference.dart';
import 'package:document_appmobile/app/util/dio/dio_exception.dart';
import 'package:document_appmobile/src/data/model/folder/folder.dart';
import 'package:document_appmobile/src/data/model/login/login_user.dart';
import 'package:document_appmobile/src/data/model/login/user_infor.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../util.dart';
import 'dior_authorization_interceptor.dart';
import 'logger_interceptor.dart';

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
              'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiIwMGMxODUyZi1lZjAwLTRkNmYtYTA3Yi1jNzNkMmRlMTVhNzgiLCJFbWFpbCI6Im5naGlhcHRAaGlzb2Z0LnZuIiwiRmlyc3ROYW1lIjoiTmdoxKlhIiwiTGFzdE5hbWUiOiJQaOG6oW0gVHLhu41uZyIsIlVzZXJOYW1lIjoiYWQiLCJEZXBhcnRtZW50SWQiOiIzNjYiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJBZG1pbiIsIk1vZHVsZXMiOlsiUlJSUjEiLCJBU1NFVCIsIkxJQlJBUlkiLCJMTVMiLCJET0NVTUVOVCIsIlRBU0sgTUFOQUdFUiIsIklUIEFTU0VUIl0sInBlcm1pc3Npb25zIjpbIkhvbWVfTGlzdCIsIkhvbWVfQ3JlYXRlVGFzayIsIkhvbWVfQm9hcmQiLCJIb21lX0NhbGVuZGFyIiwiTXlUYXNrX092ZXJ2aWV3IiwiTXlUYXNrX1Rhc2tTZW5kIiwiTXlUYXNrX0NyZWF0ZVRhc2siLCJNeVRhc2tfQXNzaWduZWRUYXNrIiwiTXlUYXNrX0NhbGVuZGFyIiwiUmVxdWVzdF9PdmVydmlldyIsIlJlcXVlc3RfUmVxdWVzdFNlbmQiLCJSZXF1ZXN0X0NyZWF0ZVJlcXVlc3QiLCJSZXF1ZXN0X1JlcXVlc3RSZWNlaXZlZCJdLCJQaG9uZU51bWJlciI6IjAxMjM0NTY3ODkiLCJleHAiOjE2NjcyOTExNTYsImlzcyI6IlZpZXRKZXRfQXBpR2F0ZXdheSIsImF1ZCI6IlZpZXRKZXRfQXBpR2F0ZXdheSJ9.5bnRP9bC3kDM0z4RZpV1T0Mzi9JF05ThvGiThYn4lpU'
        }));
    // dio.interceptors.addAll([
    //   //  LoggerInterceptor(),
    //   //         AuthorizationInterceptor(),
    //   if (AppConstant.DIO_CLIENT_DEBUG_LOG)
    //     PrettyDioLogger(
    //         // requestHeader: true,
    //         // requestBody: true,
    //         // responseBody: true,
    //         // responseHeader: true,
    //         error: true,
    //         compact: true,
    //         maxWidth: 90)
    // ]);

    // DioClient()
    //     : _dio = Dio(BaseOptions(
    //           connectTimeout: AppConstant.connectionTimeout,
    //           receiveTimeout: AppConstant.receiveTimeout,
    //           responseType: ResponseType.json,
    //           headers: {
    //             HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    //             HttpHeaders.authorizationHeader:
    //                 'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiIwMGMxODUyZi1lZjAwLTRkNmYtYTA3Yi1jNzNkMmRlMTVhNzgiLCJFbWFpbCI6Im5naGlhcHRAaGlzb2Z0LnZuIiwiRmlyc3ROYW1lIjoiTmdoxKlhIiwiTGFzdE5hbWUiOiJQaOG6oW0gVHLhu41uZyIsIlVzZXJOYW1lIjoiYWQiLCJEZXBhcnRtZW50SWQiOiIzNjYiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJBZG1pbiIsIk1vZHVsZXMiOlsiUlJSUjEiLCJBU1NFVCIsIkxJQlJBUlkiLCJMTVMiLCJET0NVTUVOVCIsIlRBU0sgTUFOQUdFUiIsIklUIEFTU0VUIl0sInBlcm1pc3Npb25zIjpbIkhvbWVfTGlzdCIsIkhvbWVfQ3JlYXRlVGFzayIsIkhvbWVfQm9hcmQiLCJIb21lX0NhbGVuZGFyIiwiTXlUYXNrX092ZXJ2aWV3IiwiTXlUYXNrX1Rhc2tTZW5kIiwiTXlUYXNrX0NyZWF0ZVRhc2siLCJNeVRhc2tfQXNzaWduZWRUYXNrIiwiTXlUYXNrX0NhbGVuZGFyIiwiUmVxdWVzdF9PdmVydmlldyIsIlJlcXVlc3RfUmVxdWVzdFNlbmQiLCJSZXF1ZXN0X0NyZWF0ZVJlcXVlc3QiLCJSZXF1ZXN0X1JlcXVlc3RSZWNlaXZlZCJdLCJQaG9uZU51bWJlciI6IjAxMjM0NTY3ODkiLCJleHAiOjE2NjcyOTExNTYsImlzcyI6IlZpZXRKZXRfQXBpR2F0ZXdheSIsImF1ZCI6IlZpZXRKZXRfQXBpR2F0ZXdheSJ9.5bnRP9bC3kDM0z4RZpV1T0Mzi9JF05ThvGiThYn4lpU'
    //           }))
    //         ..interceptors.addAll([
    //           // LoggerInterceptor(),
    //           // AuthorizationInterceptor(),
    //           if (AppConstant.DIO_CLIENT_DEBUG_LOG)
    //             PrettyDioLogger(
    //                 requestHeader: true,
    //                 requestBody: true,
    //                 responseBody: true,
    //                 responseHeader: true,
    //                 error: true,
    //                 compact: true,
    //                 maxWidth: 90)
    //         ]);

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
