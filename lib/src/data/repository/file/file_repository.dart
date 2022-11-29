import 'package:dio/dio.dart';
import 'package:document_mobile/app/util/dio/dio_client.dart';
import 'package:document_mobile/src/data/model/file/file_backup.dart';
import 'package:document_mobile/src/data/model/file/file_detail.dart';
import 'package:document_mobile/src/data/model/file/file_rename.dart';
import 'package:flutter/foundation.dart';

import '../../../../app/util/dio/dio_exception.dart';
import '../core/endpoint.dart';

class FileRepository {
  FileRepository({Dio? dioClient}) : _dioClient = dioClient ?? DioClient().dio;

  final Dio _dioClient;

  Future<FileDetailResponse?> fileDetailId(String fileId) async {
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

  Future<FileDetailResponse?> lockFile(String fileId, bool isBlock) async {
    try {
      final res = await _dioClient.put(
          '${Endpoints.ENDPOINTDOC}metadata/files/$fileId/lock',
          queryParameters: {'isLocked': isBlock},
          data: {'isLocked': isBlock});
      var fileBlock = res.data;
      final value = FileDetailResponse.fromMap(fileBlock);
      return value;
    } on DioError catch (e) {
      final err = DiorException.fromDioError(e).toString();
      throw err;
    } catch (e) {
      if (kDebugMode) {
        print('File block $e');
      }
    }
    return null;
  }

  Future<FileDetailResponse?> renameFile(
      String fileId, FileRename fileRename) async {
    try {
      final res = await _dioClient.put(
          '${Endpoints.ENDPOINTDOC}metadata/files/$fileId',
          data: fileRename.toMap());
      var fileBlock = res.data;
      final value = FileDetailResponse.fromMap(fileBlock);
      return value;
    } on DioError catch (e) {
      final err = DiorException.fromDioError(e).toString();
      throw err.toString();
    } catch (e) {
      if (kDebugMode) {
        print('Rename file $e');
      }
    }
    return null;
  }

  Future<FileBackUp?> backupFile(String fileId) async {
    try {
      final res = await _dioClient.post(
          '${Endpoints.ENDPOINTDOC}metadata/files/$fileId/backup',
          data: fileId);
      var backupFile = res.data;
      final value = FileBackUp.fromMap(backupFile);
      return value;
    } on DioError catch (e) {
      final err = DiorException.fromDioError(e).toString();
      throw err.toString();
    } catch (e) {
      if (kDebugMode) {
        print('File backup $e');
        throw e.toString();
      }
    }
    return null;
  }

// https://docgatewayapi.hisoft.vn/metadata/folders/6131eae4-94f7-4eea-9174-81360844e22f/lock?isLocked=true
  Future<FileBackUp?> archiveFile(String fileId) async {
    try {
      final res = await _dioClient
          .post('${Endpoints.ENDPOINTDOC}metadata/files/$fileId/archive');
      var archiveFile = res.data;
      final value = FileBackUp.fromMap(archiveFile);
      return value;
    } on DioError catch (e) {
      final err = DiorException.fromDioError(e).toString();
      throw err.toString();
    } catch (e) {
      if (kDebugMode) {
        print('Archive Delete $e');
      }
    }
    return null;
  }

  Future<void> downloadFile(String fileId) async {
    try {
      _dioClient.get(
          '${Endpoints.ENDPOINTDOC}content/files/$fileId/content-base64',
          options: Options(method: 'GET'));
    } on DioError catch (e) {
      final err = DiorException.fromDioError(e).toString();
      throw err.toString();
    } catch (e) {
      if (kDebugMode) {
        print('Dowload File $e');
      }
    }
  }
}
