// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:document_mobile/src/data/model/userscreen/userseen.dart';

class UserResponse {
  int? statusCode;
  bool? isError;
  String? message;
  List<UserSeen> userseen;
  UserResponse({
    this.statusCode,
    this.isError,
    this.message,
    required this.userseen,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'isError': isError,
      'message': message,
      'result': userseen.map((e) => e.toMap()).toList()
    };
  }

  factory UserResponse.fromMap(Map<String, dynamic> json) {
    return UserResponse(
        statusCode: json['statusCode'],
        isError: json['isError'],
        message: json['message'],
        userseen: List<UserSeen>.from(
            json['result'].map((e) => UserResponse.fromMap(e))).toList());
  }
}
