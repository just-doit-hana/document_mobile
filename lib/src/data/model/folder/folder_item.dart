// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../pagination/pagination.dart';
import 'folder_result_folder.dart';

class FolderItemResponse {
  Pagination? pagination;
  List<ResultItemFolder>? result;
  int? statusCode;
  bool? isError;
  String? message;
  FolderItemResponse({
    this.pagination,
    this.result = const <ResultItemFolder>[],
    this.statusCode,
    this.isError = true,
    this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pagination': pagination?.toMap(),
      'result': result?.map((x) => x.toMap()).toList(),
      'statusCode': statusCode,
      'isError': isError,
      'message': message,
    };
  }

  factory FolderItemResponse.fromMap(Map<String, dynamic> map) {
    return FolderItemResponse(
      pagination: map['pagination'] != null
          ? Pagination.fromMap(map['pagination'])
          : null,
      result: map['result'] != null
          ? List<ResultItemFolder>.from(
              map['result'].map(
                (x) => ResultItemFolder.fromMap(x),
              ),
            )
          : null,
      statusCode: map['statusCode'] != null ? map['statusCode'] as int : null,
      isError: map['isError'] != null ? map['isError'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  FolderItemResponse copyWith({
    Pagination? pagination,
    List<ResultItemFolder>? result,
    int? statusCode,
    bool? isError,
    String? message,
  }) {
    return FolderItemResponse(
      pagination: pagination ?? this.pagination,
      result: result ?? this.result,
      statusCode: statusCode ?? this.statusCode,
      isError: isError ?? this.isError,
      message: message ?? this.message,
    );
  }
}
