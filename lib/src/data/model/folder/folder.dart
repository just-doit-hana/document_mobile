// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FolderResponse {
  late List<Folder> result;
  bool? isError;
  int? statusCode;
  String? message;
  FolderResponse({
    required this.result,
    this.isError,
    this.statusCode,
    this.message,
  });

  FolderResponse copyWith({
    List<Folder>? result,
    bool? isError,
    int? statusCode,
    String? message,
  }) {
    return FolderResponse(
      result: result ?? this.result,
      isError: isError ?? this.isError,
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'result': result.asMap(),
      'isError': isError,
      'statusCode': statusCode,
      'message': message,
    };
  }

  factory FolderResponse.fromMap(Map<String, dynamic> map) {
    return FolderResponse(
      result: [],
      isError: map['isError'] != null ? map['isError'] as bool : null,
      statusCode: map['statusCode'] != null ? map['statusCode'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FolderResponse.fromJson(String source) =>
      FolderResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FolderResponse(result: $result, isError: $isError, statusCode: $statusCode, message: $message)';
  }

  @override
  bool operator ==(covariant FolderResponse other) {
    if (identical(this, other)) return true;

    return other.result == result &&
        other.isError == isError &&
        other.statusCode == statusCode &&
        other.message == message;
  }

  @override
  int get hashCode {
    return result.hashCode ^
        isError.hashCode ^
        statusCode.hashCode ^
        message.hashCode;
  }
}

class Folder {
  String? id;
  String? name;
  List<SubFolders>? subFolders;
  bool? hasFiles;
}

class SubFolders {
  String? id;
  String? name;
  List<SubFolders>? subFolders;
  bool? hasFiles;
}
