class FileMoveTo {
  String? result;
  int? statusCode;
  bool? isError;
  String? message;
  FileMoveTo({
    this.result,
    this.statusCode,
    this.isError,
    this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'result': result,
      'statusCode': statusCode,
      'isError': isError,
      'message': message,
    };
  }

  factory FileMoveTo.fromMap(Map<String, dynamic> map) {
    return FileMoveTo(
      result: map['result'] != null ? map['result'] as String : null,
      statusCode: map['statusCode'] != null ? map['statusCode'] as int : null,
      isError: map['isError'] != null ? map['isError'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }
}
