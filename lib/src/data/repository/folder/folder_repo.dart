import 'package:dio/dio.dart';
import 'package:document_appmobile/src/data/model/folder/folder_item.dart';
import 'package:document_appmobile/src/data/model/restore/folder_restore.dart';
import 'package:document_appmobile/src/data/repository/core/endpoint.dart';
import 'package:flutter/foundation.dart';

import '../../../../app/util/dio/dio_client.dart';
import '../../../../app/util/dio/dio_exception.dart';
import '../../model/folder/folder.dart';
import '../../model/folder/folder_test_no.dart';

class FolderRepository {
  FolderRepository({
    Dio? dioClient,
  }) : _dioClient = dioClient ?? DioClient().dio;

  final Dio _dioClient;

  Future<dynamic> listPublicFolder() async {
    try {
      final res = await _dioClient
          .get('${Endpoints.ENDPOINTDOC}metadata/folders/tree/public');
      var folder = res.data['result'];
      final value = Result.fromJson(folder);
      return value;
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print('List public folder $e');
      }
      throw e.toString();
    }
  }

  Future<dynamic> listPrivateFolder() async {
    try {
      final res =
          await _dioClient.get('${Endpoints.ENDPOINTDOC}metadata/folders/tree');
      var folderPrivate = res.data['result'];
      print('Folder Private ${folderPrivate}');
      final value = Result.fromJson(folderPrivate);

      return value;
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print('List private public $e');
      }
      throw e.toString();
    }
  }

  Future<FolderItemResponse?> listItemPublic(String id) async {
    try {
      final res = await _dioClient
          .get('${Endpoints.ENDPOINTDOC}metadata/folders/items?id=$id');
      var folder = res.data;
      final value = FolderItemResponse.fromJson(folder);
      return value;
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print('List Item Public $e');
      }
      throw e.toString();
    }
  }

  Future<FolderItemResponse?> listRecycleBin() async {
    try {
      final res = await _dioClient.get(
          '${Endpoints.ENDPOINTDOC}metadata/folders/items/archived',
          queryParameters: {
            'PageNumber': 1,
            'MaxPageSize': 10,
          });

      var recycleBin = res.data;
      final value = FolderItemResponse.fromJson(recycleBin);
      return value;
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print('Recycle bin $e');
      }
      throw e.toString();
    }
  }

  Future<void> deteleRecycleBin(String id) async {
    try {
      await _dioClient.delete('${Endpoints.ENDPOINTDOC}metadata/folders/$id');
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print('Delete recycle bin $e');
      }
      throw e.toString();
    }
  }

  Future<FolderRestoreResponse?> restoreRecycleBin(String id) async {
    try {
      final res = await _dioClient
          .post('${Endpoints.ENDPOINTDOC}metadata/files/$id/restoration');
      var restore = res.data;
      final value = FolderRestoreResponse.fromJson(restore);
      return value;
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print('Restore recycle bin $e');
      }
      throw e.toString();
    }
  }

  Future<List<TestNoMap>> getTest() async {
    try {
      final res = await _dioClient
          .get('https://taskapi.hisoft.vn/api/Domain?PageSize=50');
      final domain =
          (res.data as List).map((json) => TestNoMap.fromJson(json)).toList();
      return domain;
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw e.toString();
    }
  }
}
