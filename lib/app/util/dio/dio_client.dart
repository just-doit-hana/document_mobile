// ignore: file_names
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:document_mobile/app/helper/shared_preference.dart';
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
    late String? token = SharedPreferenceHelper.instance.getString("token");
    final dio = Dio(BaseOptions(
        // connectTimeout: AppConstant.connectionTimeout,
        receiveTimeout: AppConstant.receiveTimeout,
        responseType: ResponseType.json,
        contentType: 'application/json; charset=utf-8',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          HttpHeaders.authorizationHeader: token
        }));
    dio.interceptors.addAll([
      //  LoggerInterceptor(),
      // AuthorizationInterceptor(),
      if (AppConstant.DIO_CLIENT_DEBUG_LOG)
        PrettyDioLogger(
            requestHeader: true,
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
