import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../app/util/dio/dio_client.dart';
import '../../../../app/util/dio/dio_exception.dart';
import '../../model/folder/folder.dart';

class FolderRepository {
  FolderRepository({
    Dio? dioClient,
  }) : _dioClient = dioClient ?? DioClient().dio;

  final Dio _dioClient;

  Future<List<FolderResponse>?> listPublicFolder() async {
    try {
      final res = await _dioClient
          .get('https://docgatewayapi.hisoft.vn/metadata/folders/tree/public');

      // if (res.statusCode == 200) {
      final List result = res.data['result'];
      // print('test ${res.data['result']}');
      return result.map((e) => FolderResponse.fromJson(e)).toList();
      // }
    } on DioError catch (e) {
      final errorMessage = DiorException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      // throw e.toString();
    }
    // return [];
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
