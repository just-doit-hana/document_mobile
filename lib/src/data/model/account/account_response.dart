import 'package:document_mobile/src/data/model/account/account.dart';
import 'package:document_mobile/src/data/model/pagination/pagination.dart';

class AccountResponse {
  Pagination? pagination;
  List<Account> account;
  int? statusCode;
  bool? isError;
  String? message;
  AccountResponse({
    this.pagination,
    required this.account,
    this.statusCode,
    this.isError,
    this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pagination': pagination?.toMap(),
      'result': account.map((e) => e.toMap()).toList(),
      'statusCode': statusCode,
      'message': message,
      'isError': isError,
    };
  }

  factory AccountResponse.fromMap(Map<String, dynamic> json) {
    return AccountResponse(
        pagination: Pagination.fromMap(json['pagination']),
        account:
            List<Account>.from(json['result'].map((e) => Account.fromMap(e))),
        statusCode: json['statusCode'],
        message: json['message'],
        isError: json['isError']);
  }
}
