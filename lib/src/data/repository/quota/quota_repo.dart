import 'package:dio/dio.dart';
import 'package:document_mobile/app/util/dio/dio_client.dart';
import 'package:document_mobile/app/util/dio/dio_exception.dart';
import 'package:document_mobile/src/data/model/quota/quota.dart';
import 'package:document_mobile/src/data/repository/core/endpoint.dart';
import 'package:flutter/foundation.dart';

class QuotaRepository {
  QuotaRepository({
    Dio? dioClient,
  }) : _dioClient = dioClient ?? DioClient().dio;

  final Dio _dioClient;

  Future<Quota?> getQuotaByAccount(String accountId) async {
    try {
      final res = await _dioClient
          .get('${Endpoints.ENDPOINTDOC}content/account/$accountId/usage');
      var quota = res.data;
      final value = Quota.fromMap(quota);
      return value;
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print('Get Quota $e');
      }
      throw e.toString();
    }
  }
}
