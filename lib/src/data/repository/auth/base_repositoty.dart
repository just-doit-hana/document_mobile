import 'package:document_appmobile/app/model/app_reponse.dart';
import 'package:document_appmobile/src/data/model/login/login_user.dart';

import '../../model/login/user_infor.dart';

abstract class BaseRepository {
  Future<AppResponse<UserInfor?>> loginUser(LoginUser loginUser);
}
