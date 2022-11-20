import '../../../../app/util/dio/dio_client.dart';
import '../../model/login/login_user.dart';
import '../../model/login/user_infor.dart';
import 'base_repositoty.dart';

class LoginRepository implements BaseRepository {
  LoginRepository({
    required this.dioClient,
  });

  final DioClient dioClient;

  Future<UserInfor?> loginUser(LoginUser loginUser) {
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
