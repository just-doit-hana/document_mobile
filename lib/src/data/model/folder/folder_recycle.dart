import '../pagination/pagination.dart';
import '../sharewith/share_with.dart';
import '../tags/tags.dart';

class FolderRecycleReponse {
  Pagination? pagination;
  List<ResultItemFolder>? result;
  int? statusCode;
  bool? isError;
  String? message;
  FolderRecycleReponse({
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

  factory FolderRecycleReponse.fromMap(Map<String, dynamic> map) {
    return FolderRecycleReponse(
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
}

class ResultItemFolder {
  String? id;
  String? name;
  String? nameWithExtension;
  String? type;
  int? size;
  bool? isLocked;
  bool? isShortcut;
  bool? isUploading;
  String? ownerID;
  String? accessScope;
  String? targetAccessScope;
  String? lastModified;
  List<Tags>? tags;
  bool? isArchived;
  bool? isBackup;
  List<SharedWith>? sharedWith;
  ResultItemFolder({
    this.id,
    this.name,
    this.nameWithExtension,
    this.type,
    this.size,
    this.isLocked,
    this.isShortcut,
    this.isUploading,
    this.ownerID,
    this.accessScope,
    this.targetAccessScope,
    this.lastModified,
    this.tags = const <Tags>[],
    this.isArchived,
    this.isBackup,
    this.sharedWith = const <SharedWith>[],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'nameWithExtension': nameWithExtension,
      'type': type,
      'size': size,
      'isLocked': isLocked,
      'isShortcut': isShortcut,
      'isUploading': isUploading,
      'ownerID': ownerID,
      'accessScope': accessScope,
      'targetAccessScope': targetAccessScope,
      'lastModified': lastModified,
      'tags': tags?.map((x) => x.toMap()).toList(),
      'isArchived': isArchived,
      'isBackup': isBackup,
      'sharedWith': sharedWith?.map((x) => x.toMap()).toList(),
    };
  }

  factory ResultItemFolder.fromMap(Map<String, dynamic> map) {
    return ResultItemFolder(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      nameWithExtension: map['nameWithExtension'] != null
          ? map['nameWithExtension'] as String
          : null,
      type: map['type'] != null ? map['type'] as String : null,
      size: map['size'] != null ? map['size'] as int : null,
      isLocked: map['isLocked'] != null ? map['isLocked'] as bool : null,
      isShortcut: map['isShortcut'] != null ? map['isShortcut'] as bool : null,
      isUploading:
          map['isUploading'] != null ? map['isUploading'] as bool : null,
      ownerID: map['ownerID'] != null ? map['ownerID'] as String : null,
      accessScope:
          map['accessScope'] != null ? map['accessScope'] as String : null,
      targetAccessScope: map['targetAccessScope'] != null
          ? map['targetAccessScope'] as String
          : null,
      lastModified:
          map['lastModified'] != null ? map['lastModified'] as String : null,
      tags: map['tags'] != null
          ? List<Tags>.from(
              map['tags'].map(
                (x) => Tags.fromJson(x),
              ),
            )
          : null,
      isArchived: map['isArchived'] != null ? map['isArchived'] as bool : null,
      isBackup: map['isBackup'] != null ? map['isBackup'] as bool : null,
      sharedWith: map['sharedWith'] != null
          ? List<SharedWith>.from(
              map['sharedWith'].map(
                (x) => SharedWith.fromMap(x),
              ),
            )
          : null,
    );
  }
}
