import 'package:dio/dio.dart';
import 'package:document_mobile/app/util/dio/dio_client.dart';
import 'package:document_mobile/app/util/dio/dio_exception.dart';
import 'package:document_mobile/src/data/model/account/account_response.dart';
import 'package:document_mobile/src/data/model/userscreen/userseen_response.dart';
import 'package:document_mobile/src/data/repository/core/endpoint.dart';
import 'package:flutter/foundation.dart';

class AccountRepository {
  final Dio _dioClient;

  AccountRepository({Dio? dioClient})
      : _dioClient = dioClient ?? DioClient().dio;

  Future<AccountResponse?> getListAccount() async {
    try {
      final res = await _dioClient.get('${Endpoints.ENDPOINTDOC}auth/accounts');
      var account = res.data;
      final value = AccountResponse.fromMap(account);

      return value;
    } on DioError catch (e) {
      final error = DiorException.fromDioError(e).toString();
      throw error;
    } catch (e) {
      if (kDebugMode) {
        print('Get Account user $e');
      }
      throw e.toString();
    }
  }

  Future<UserSeenResponse?> getListUserSeen({required String fileId}) async {
    try {
      final res = await _dioClient
          .get('${Endpoints.ENDPOINTDOC}metadata/files/$fileId/users-seen');
      var userSeen = res.data;
      final value = UserSeenResponse.fromMap(userSeen);
      return value;
    } on DioError catch (e) {
      final error = DiorException.fromDioError(e).toString();
      throw error;
    } catch (e) {
      if (kDebugMode) {
        print('List user seen $e');
      }
      throw e.toString();
    }
  }
}
