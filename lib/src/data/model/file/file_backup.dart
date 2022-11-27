// ignore_for_file: public_member_api_docs, sort_constructors_first
class FileBackUpRespose {
  FileBackUp? fileBackUp;
  int? statusCode;
  bool? isError;
  String? message;
  FileBackUpRespose({
    this.fileBackUp,
    this.statusCode,
    this.isError,
    this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'result': fileBackUp?.toMap(),
      'statusCode': statusCode,
      'isError': isError,
      'message': message,
    };
  }

  factory FileBackUpRespose.fromMap(Map<String, dynamic> map) {
    return FileBackUpRespose(
      fileBackUp: map['result'] != null
          ? FileBackUp.fromMap(map['fileBaresultckUp'])
          : null,
      statusCode: map['statusCode'] != null ? map['statusCode'] as int : null,
      isError: map['isError'] != null ? map['isError'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }
}

class FileBackUp {
  String? fileId;
  String? folderId;
  FileBackUp({
    this.fileId,
    this.folderId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fileId': fileId,
      'folderId': folderId,
    };
  }

  factory FileBackUp.fromMap(Map<String, dynamic> map) {
    return FileBackUp(
      fileId: map['fileId'] != null ? map['fileId'] as String : null,
      folderId: map['folderId'] != null ? map['folderId'] as String : null,
    );
  }
}
