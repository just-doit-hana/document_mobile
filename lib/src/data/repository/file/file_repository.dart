import 'package:dio/dio.dart';
import 'package:document_mobile/app/util/dio/dio_client.dart';
import 'package:document_mobile/src/data/model/file/file_detail.dart';
import 'package:flutter/foundation.dart';

import '../../../../app/util/dio/dio_exception.dart';
import '../core/endpoint.dart';

class FileRepository {
  FileRepository({Dio? dioClient}) : _dioClient = dioClient ?? DioClient().dio;

  final Dio _dioClient;

  Future<FileDetailResponse?> folderDetailId(String fileId) async {
    try {
      final res = await _dioClient
          .get('${Endpoints.ENDPOINTDOC}metadata/files/$fileId');
      var folder = res.data;
      final value = FileDetailResponse.fromMap(folder);
      return value;
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print('File Detail $e');
      }
      throw e.toString();
    }
  }
}
