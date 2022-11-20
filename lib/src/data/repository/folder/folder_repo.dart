import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';

import '../../../../app/util/dio/dio_client.dart';
import '../../../../app/util/dio/dio_exception.dart';
import '../../model/folder/folder.dart';
import '../../model/folder/folder_item.dart';
import '../../model/restore/folder_restore.dart';
import '../core/endpoint.dart';

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

  Future<FolderItemResponse?> listPrivateFolder() async {
    try {
      final res = await _dioClient.get(
          '${Endpoints.ENDPOINTDOC}metadata/folders/items?PageNumber=1&MaxPageSize=10');
      var folderPrivate = res.data;
      final value = FolderItemResponse.fromMap(folderPrivate);
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
      final value = FolderItemResponse.fromMap(folder);
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
//  https://docgatewayapi.hisoft.vn/metadata/folders/items?PageNumber=1&MaxPageSize=10

  Future<FolderItemResponse?> listRecycleBin({
    required int page,
    int pageSize = 15,
  }) async {
    try {
      final res = await _dioClient.get(
          '${Endpoints.ENDPOINTDOC}metadata/folders/items/archived',
          queryParameters: {
            'PageNumber': page,
            'MaxPageSize': pageSize,
          });

      var recycleBin = res.data;
      final value = FolderItemResponse.fromMap(recycleBin);
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

  Future<dynamic> deteleRecycleBinFolder(String id) async {
    try {
      await _dioClient.delete('${Endpoints.ENDPOINTDOC}metadata/folders/$id');
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print('Delete recycle bin folder $e');
      }
      throw e.toString();
    }
  }

  Future<dynamic> deleteRecycleBinFile(String id) async {
    try {
      await _dioClient.delete('${Endpoints.ENDPOINTDOC}metadata/files/$id');
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print('Delete recycle bin file $e');
      }
      throw e.toString();
    }
  }

  Future<FolderRestoreResponse?> restoreRecycleFileBin(String id) async {
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
        print('Restore recycle bin file $e');
      }
      throw e.toString();
    }
  }

  Future<FolderRestoreResponse?> restoreRecycleFolderBin(String id) async {
    try {
      final res = await _dioClient
          .post('${Endpoints.ENDPOINTDOC}metadata/folders/$id/restoration');
      var restore = res.data;
      final value = FolderRestoreResponse.fromJson(restore);
      return value;
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print('Restore recycle bin folder $e');
      }
      throw e.toString();
    }
  }

  Future<FolderRestoreResponse?> restoreRecycleBackup(String id) async {
    try {
      final res = await _dioClient.post(
          '${Endpoints.ENDPOINTDOC}metadata/files/$id/restoration-backup');
      var restoreBackup = res.data;
      final value = FolderRestoreResponse.fromJson(restoreBackup);
      return value;
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print('Restore backup $e');
      }
      throw e.toString();
    }
  }

  Future<FolderItemResponse?> backupFolder() async {
    try {
      final res = await _dioClient.get(
          '${Endpoints.ENDPOINTDOC}metadata/folders/items/backup',
          queryParameters: {'PageNumber': 1, 'MaxPageSize': 10});
      var backUp = res.data;
      final value = FolderItemResponse.fromMap(backUp);
      return value;
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print('Backup folder $e');
      }
      throw e.toString();
    }
  }

  // Future<List<TestNoMap>> getTest() async {
  //   try {
  //     final res = await _dioClient
  //         .get('https://taskapi.hisoft.vn/api/Domain?PageSize=50');
  //     final domain =
  //         (res.data as List).map((json) => TestNoMap.fromJson(json)).toList();
  //     return domain;
  //   } on DioError catch (e) {
  //     final errorMessage = DiorException.fromDioError(e).toString();
  //     throw errorMessage;
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //     throw e.toString();
  //   }
  // }
}
