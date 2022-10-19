import 'package:document_appmobile/src/data/model/login/login_user.dart';

import '../../model/login/user_infor.dart';

abstract class BaseRepository {
  Future<UserInfor?> loginUser(LoginUser loginUser);
}
