import 'package:dio/dio.dart';
import 'package:document_mobile/app/util/dio/dio_client.dart';
import 'package:document_mobile/src/data/model/versionsfile/version_response.dart';
import 'package:document_mobile/src/data/repository/core/endpoint.dart';
import 'package:flutter/foundation.dart';

import '../../../../app/util/dio/dio_exception.dart';

class VersionRepository {
  VersionRepository({
    Dio? dioClient,
  }) : _dioClient = dioClient ?? DioClient().dio;

  final Dio _dioClient;

  Future<VersionReponse> listVersionFile({required String fileId}) async {
    try {
      final res = await _dioClient
          .get('${Endpoints.ENDPOINTDOC}content/files/$fileId/versions');
      var versions = res.data;
      final value = VersionReponse.fromMap(versions);
      return value;
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print('List version $e');
      }
      throw e.toString();
    }
  }
}
