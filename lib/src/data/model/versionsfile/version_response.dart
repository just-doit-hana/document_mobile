// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:document_mobile/src/data/model/versionsfile/version_file.dart';

class VersionReponse {
  List<VersionFile> version;
  int? statusCode;
  bool? isError;
  String? message;
  VersionReponse({
    required this.version,
    this.statusCode,
    this.isError,
    this.message,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'result': version.map((e) => e.toMap()).toList(),
      'statusCode': statusCode,
      'isError': isError,
      'message': message,
    };
  }

  factory VersionReponse.fromMap(Map<String, dynamic> json) {
    return VersionReponse(
        statusCode: json['statusCode'],
        isError: json['isError'],
        message: json['message'],
        version: List<VersionFile>.from(
            json['result'].map((e) => VersionFile.fromMap(e))).toList());
  }
}
