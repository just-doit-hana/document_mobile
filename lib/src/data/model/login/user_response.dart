import 'package:document_mobile/src/data/model/login/user_infor.dart';

class UserLoginReponse {
  int statusCode;
  bool isError;
  String message;
  UserInfor infor;
  UserLoginReponse({
    required this.statusCode,
    required this.isError,
    required this.message,
    required this.infor,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'isError': isError,
      'message': message,
      'result': infor.toMap(),
    };
  }

  factory UserLoginReponse.fromMap(Map<String, dynamic> map) {
    return UserLoginReponse(
        statusCode: map['statusCode'],
        isError: map['isError'],
        message: map['message'],
        infor: UserInfor.fromMap(map['result']));
  }
}
