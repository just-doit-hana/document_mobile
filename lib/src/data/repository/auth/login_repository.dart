import 'package:dio/dio.dart';
import 'package:document_appmobile/app/model/app_reponse.dart';
import 'package:document_appmobile/src/data/model/login/user_infor.dart';
import 'package:document_appmobile/src/data/model/login/login_user.dart';
import 'package:document_appmobile/src/data/repository/auth/base_repositoty.dart';
import 'package:document_appmobile/src/data/repository/core/endpoint.dart';

import '../../../../app/util/dio/dio_client.dart';

class LoginRepository implements BaseRepository {
  LoginRepository({
    Dio? dioClient,
  }) : _dioClient = dioClient ?? DioClient().dio;

  final Dio _dioClient;

  @override
  Future<AppResponse<UserInfor?>> loginUser(LoginUser loginUser) async {
    final response =
        await _dioClient.post(Endpoints.loginUser, data: loginUser.toJson());
    print('Response Data $response');
    return AppResponse<UserInfor?>.fromJson(response.data, (json) => false);
  }
}
