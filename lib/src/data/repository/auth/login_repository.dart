import 'package:document_appmobile/src/data/model/folder/folder.dart';
import 'package:document_appmobile/src/data/model/login/login_user.dart';
import 'package:document_appmobile/src/data/model/login/user_infor.dart';
import 'package:document_appmobile/src/data/repository/auth/base_repositoty.dart';

import '../../../../app/util/dio/dio_client.dart';

class LoginRepository implements BaseRepository {
  LoginRepository({
    required this.dioClient,
  });

  final DioClient dioClient;

  @override
  Future<UserInfor?> loginUser(LoginUser loginUser) {
    throw UnimplementedError();
  }

  @override
  Future<FolderResponse> listFolderPublic() {
    throw UnimplementedError();
  }

  // @override
  // Future<AppResponse<UserInfor?>> loginUser(LoginUser loginUser) async {
  //   final response =
  //       await _dioClient.post(Endpoints.loginUser, data: loginUser.toJson());
  //   print('Response Data $response');
  //   return AppResponse<UserInfor?>.fromJson(response.data, (json) => false);
  // }
}
