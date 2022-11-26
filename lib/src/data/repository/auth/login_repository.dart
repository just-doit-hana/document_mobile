import 'package:dio/dio.dart';
import 'package:document_mobile/app/helper/shared_preference.dart';
import 'package:document_mobile/app/util/dio/dio_exception.dart';
import 'package:document_mobile/src/data/model/login/user_response.dart';
import 'package:document_mobile/src/data/repository/core/endpoint.dart';
import 'package:flutter/foundation.dart';

import '../../../../app/util/dio/dio_client.dart';
import '../../model/login/login_user.dart';

class LoginRepository {
  LoginRepository({Dio? dioClient}) : _dioClient = dioClient ?? DioClient().dio;

  final Dio _dioClient;
  final shaedpref = SharedPreferenceHelper.instance;

  Future<UserLoginReponse> loginUser(LoginUser loginUser) async {
    try {
      final res = await _dioClient.post('${Endpoints.ENDPOINTDOC}auth/login',
          data: loginUser.toMap());
      var login = res.data;

      final value = UserLoginReponse.fromMap(login);
      shaedpref.setString("token", '${value.infor.sysToken}');
      shaedpref.setString("userId", '${value.infor.userID}');
      return value;
    } on DioError catch (e) {
      final error = DiorException.fromDioError(e).toString();
      throw error;
    } catch (e) {
      if (kDebugMode) {
        print('Login user $e');
      }
      throw e.toString();
    }
  }

  // @override
  // Future<AppResponse<UserInfor?>> loginUser(LoginUser loginUser) async {
  //   final response =
  //       await _dioClient.post(Endpoints.loginUser, data: loginUser.toJson());
  //   print('Response Data $response');
  //   return AppResponse<UserInfor?>.fromJson(response.data, (json) => false);
  // }
}
