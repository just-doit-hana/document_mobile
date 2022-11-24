// ignore_for_file: public_member_api_docs, sort_constructors_first
class Quota {
  bool isError;
  String message;
  int result;
  int statusCode;
  Quota({
    required this.isError,
    required this.message,
    required this.result,
    required this.statusCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isError': isError,
      'message': message,
      'result': result,
      'statusCode': statusCode,
    };
  }

  factory Quota.fromMap(Map<String, dynamic> map) {
    return Quota(
      isError: map['isError'],
      message: map['message'],
      result: map['result'],
      statusCode: map['statusCode'],
    );
  }
}
