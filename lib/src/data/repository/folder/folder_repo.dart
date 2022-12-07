import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';

import '../../../../app/util/dio/dio_client.dart';
import '../../../../app/util/dio/dio_exception.dart';
import '../../model/folder/folder.dart';
import '../../model/folder/folder_detail.dart';
import '../../model/folder/folder_item.dart';
import '../../model/restore/folder_restore.dart';
import '../core/endpoint.dart';

class FolderRepository {
  FolderRepository({
    Dio? dioClient,
  }) : _dioClient = dioClient ?? DioClient().dio;

  final Dio _dioClient;

  Future<FolderDetailResponse?> lockFolder(
      String folderId, bool isBlock) async {
    try {
      final res = await _dioClient.put(
          '${Endpoints.ENDPOINTDOC}metadata/folders/$folderId/lock',
          queryParameters: {'isLocked': isBlock},
          data: {'isLocked': isBlock});
      var fileBlock = res.data;
      final value = FolderDetailResponse.fromMap(fileBlock);
      return value;
    } on DioError catch (e) {
      final err = DiorException.fromDioError(e).toString();
      throw err;
    } catch (e) {
      if (kDebugMode) {
        print('Folder lock $e');
      }
    }
    return null;
  }

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

  // Future<Quota?> getQuotaByAccount(String accountId) async {
  //   try {
  //     final res = await _dioClient
  //         .get('${Endpoints.ENDPOINTDOC}content/account/$accountId/usage');
  //     var quota = res.data;
  //     final value = Quota.fromMap(quota);
  //     return value;
  //   } on DioError catch (e) {
  //     final errorMessage = DiorException.fromDioError(e).toString();
  //     throw errorMessage;
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Get Quota $e');
  //     }
  //     throw e.toString();
  //   }
  // }

  Future<FolderItemResponse?> listPrivateFolder() async {
    try {
      final res = await _dioClient.get(
          '${Endpoints.ENDPOINTDOC}metadata/folders/items',
          queryParameters: {'PageNumber': 1, 'MaxPageSize': 10});
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

  Future<FolderItemResponse?> listPrivateFolderSearch(String searchText) async {
    try {
      // metadata/folders/items?SearchText=s&PageNumber=1&MaxPageSize=10
      final res = await _dioClient.get(
          '${Endpoints.ENDPOINTDOC}metadata/folders/items',
          queryParameters: {
            'SearchText': searchText,
            'PageNumber': 1,
            'MaxPageSize': 10
          });
      var folderPrivateSearch = res.data;
      final value = FolderItemResponse.fromMap(folderPrivateSearch);
      return value;
    } on DioError catch (e) {
      final error = DiorException.fromDioError(e).toString();
      throw error;
    } catch (e) {
      if (kDebugMode) {
        print('Search item private error');
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

  Future<FolderItemResponse?> listRecycleBin({
    required int page,
    int pageSize = 10,
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

  Future<FolderItemResponse> listRecycleBinTest({
    required int page,
    int pageSize = 10,
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

  Future<FolderItemResponse?> listShareFile() async {
    try {
      final res = await _dioClient.get(
          '${Endpoints.ENDPOINTDOC}metadata/folders/items/shared',
          queryParameters: {'PageNumber': 1, 'MaxPageSize': 10});
      var shareFile = res.data;
      final value = FolderItemResponse.fromMap(shareFile);
      return value;
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print('Share file  $e');
      }
      throw e.toString();
    }
  }

  Future<FolderDetailResponse?> folderDetailId(String folderId) async {
    try {
      final res = await _dioClient
          .get('${Endpoints.ENDPOINTDOC}metadata/folders/$folderId');
      var folder = res.data;
      final value = FolderDetailResponse.fromMap(folder);
      return value;
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print('Folder Detail $e');
      }
      throw e.toString();
    }
  }

  Future<FolderDetailResponse?> folderRename(
      String folderId, String name) async {
    try {
      final res = await _dioClient.put(
          '${Endpoints.ENDPOINTDOC}metadata/folders/$folderId',
          data: {'name': name});
      var folder = res.data;
      final value = FolderDetailResponse.fromMap(folder);
      return value;
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print('Folder Detail $e');
      }
      throw e.toString();
    }
  }

  Future<FolderDetailResponse?> archiveFolder(String folderId) async {
    try {
      final res = await _dioClient
          .post('${Endpoints.ENDPOINTDOC}metadata/folders/$folderId/archive');
      var archiveFolder = res.data;
      final value = FolderDetailResponse.fromMap(archiveFolder);
      return value;
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print('Achive Folder $e');
      }
      throw e.toString();
    }
  }

  Future<FolderDetailResponse?> moveToFolder(
      String folderId, String destinationFolderID) async {
    try {
      final res = await _dioClient.put(
          '${Endpoints.ENDPOINTDOC}metadata/folders/$folderId/location?destinationFolderID',
          queryParameters: {'destinationFolderID': destinationFolderID});
      var moveFolder = res.data;
      final value = FolderDetailResponse.fromMap(moveFolder);
      return value;
    } on DioError catch (e) {
      final error = DiorException.fromDioError(e).toString();
      throw error;
    } catch (e) {
      if (kDebugMode) {
        print('Move to folder $e');
      }
    }
    return null;
  }

  Future<FolderDetailResponse?> copyToFolder(
      String folderId, String destinationFolderID) async {
    try {
      final res = await _dioClient.put(
          '${Endpoints.ENDPOINTDOC}metadata/folders/$folderId/copy?destinationFolderID',
          queryParameters: {'destinationFolderID': destinationFolderID});
      var copyFolder = res.data;
      final value = FolderDetailResponse.fromMap(copyFolder);
      return value;
    } on DioError catch (e) {
      final error = DiorException.fromDioError(e).toString();
      throw error;
    } catch (e) {
      if (kDebugMode) {
        print('Copy to folder $e');
      }
    }
    return null;
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
