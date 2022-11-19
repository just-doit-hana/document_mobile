class FolderResponse {
  Result? result;
  int? statusCode;
  bool? isError;
  String? message;
  FolderResponse({
    this.result,
    this.statusCode,
    this.isError,
    this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'result': result!.toJson(),
      'statusCode': statusCode,
      'isError': isError,
      'message': message,
    };
  }

  factory FolderResponse.fromMap(Map<String, dynamic> map) {
    return FolderResponse(
      result: map['result'] != null
          ? Result.fromJson(map['result'] as Map<String, dynamic>)
          : null,
      statusCode: map['statusCode'] != null ? map['statusCode'] as int : null,
      isError: map['isError'] != null ? map['isError'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }
}

class Result {
  Result({
    required this.id,
    required this.name,
    this.subFolders = const <Result>[],
    required this.hasFiles,
  });

  String id;
  String name;
  List<Result> subFolders;
  bool hasFiles;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        subFolders: List<Result>.from(
            json["subFolders"].map((x) => Result.fromJson(x))),
        hasFiles: json["hasFiles"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "subFolders": List<dynamic>.from(subFolders.map((x) => x.toJson())),
        "hasFiles": hasFiles,
      };
}
