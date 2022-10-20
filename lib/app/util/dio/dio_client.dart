// ignore: file_names
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:document_appmobile/app/helper/shared_preference.dart';
import 'package:document_appmobile/app/util/dio/dio_exception.dart';
import 'package:document_appmobile/src/data/model/login/login_user.dart';
import 'package:document_appmobile/src/data/model/login/user_infor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../util.dart';

class DioClient {
  late final Dio _dio;
  final shaedpref = SharedPreferenceHelper.instance;

  DioClient()
      : _dio = Dio(BaseOptions(
            connectTimeout: AppConstant.connectionTimeout,
            receiveTimeout: AppConstant.receiveTimeout,
            responseType: ResponseType.json,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
              HttpHeaders.authorizationHeader:
                  'bearer ${SharedPreferenceHelper.instance.getString('dmsToken')}'
            }))
          ..interceptors.addAll([
            // LoggerInterceptor(),
            // AuthorizationInterceptor(),
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

  Future<UserInfor?> login(LoginUser loginUser) async {
    try {
      final res = await _dio.post("https://docgatewayapi.hisoft.vn/auth/login",
          data: loginUser.toJson());
      UserInfor userInfor = UserInfor.fromJson(res.data);
      print('UserTest ${userInfor.dmsToken}');
      // if (res.statusCode == 200) {
      //   shaedpref.setString("dmsToken", '${userInfor.dmsToken}');
      // }
      return userInfor;
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      print(e);
      // throw e.toString();
    }
    return null;
  }
}
