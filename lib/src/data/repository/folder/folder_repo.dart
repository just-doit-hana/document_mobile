import 'package:dio/dio.dart';
import 'package:document_appmobile/src/data/model/folder/folder_item.dart';
import 'package:document_appmobile/src/data/repository/core/endpoint.dart';
import 'package:flutter/foundation.dart';

import '../../../../app/util/dio/dio_client.dart';
import '../../../../app/util/dio/dio_exception.dart';
import '../../model/folder/folder.dart';

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
        print(e);
      }
      throw e.toString();
    }
  }

  Future<dynamic> listItemPublic(String id) async {
    try {
      final res = await _dioClient
          .get('${Endpoints.ENDPOINTDOC}metadata/folders/items?id=$id');
      var folderItem = res.data['result'];
      print(folderItem);
      final value = FolderItemResponse.fromMap(folderItem);
      return value;
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



// Future<List<FolderModel>> getUser() async {
//   String endpoint = 'https://reqres.in/api/users?page=2';

//   final response = await http.get(Uri.parse(endpoint));
//   if (response.statusCode == 200) {
//     final List result = jsonDecode(response.body)['data'];
//     return result.map((e) => FolderModel.fromJson(e)).toList();
//   } else {
//     throw Exception(response.reasonPhrase);
