import 'package:dio/dio.dart';
import 'package:document_mobile/app/util/dio/dio_client.dart';
import 'package:document_mobile/app/util/dio/dio_exception.dart';
import 'package:document_mobile/src/data/model/account/account_response.dart';
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
      print(value);
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
}
