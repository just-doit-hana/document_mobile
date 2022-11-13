class FolderItemResponse {
  late Pagination pagination;
  late List<ResultItemFolder> result;
  late int statusCode;
  late bool isError;
  late String message;
  FolderItemResponse({
    required this.pagination,
    required this.result,
    required this.statusCode,
    required this.isError,
    required this.message,
  });

  FolderItemResponse.fromJson(Map<String, dynamic> json) {
    pagination = Pagination.fromMap(json['pagination']);
    statusCode = json['statusCode'];
    isError = json['isError'] ?? '';
    message = json['message'];
    // if (json['result'] != null) {
    json['result'].forEach((v) {
      result = <ResultItemFolder>[];
      result.add(ResultItemFolder.fromJson(v));
    });
  }
  // }
}

class Pagination {
  int? totalCount;
  int? maxPageSize;
  int? currentPage;
  int? totalPages;
  bool? hasNext;
  bool? hasPrevious;
  Pagination({
    this.totalCount,
    this.maxPageSize,
    this.currentPage,
    this.totalPages,
    this.hasNext = false,
    this.hasPrevious = false,
  });

  Pagination.fromMap(Map<String, dynamic> map) {
    totalCount = map['totalCount'];
    maxPageSize = map['maxPageSize'];
    currentPage = map['currentPage'];
    totalPages = map['totalPages'];
    hasNext = map['hasNext'];
    hasPrevious = map['hasPrevious'];
  }
}

class Tags {
  int? id;
  String? name;
  String? hexColor;
  Tags({this.id, this.name, this.hexColor});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'hexColor': hexColor};
  }

  factory Tags.fromMap(Map<String, dynamic> map) {
    return Tags(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      hexColor: map['hexColor'] ? map['hexColor'] as String : null,
    );
  }
}

class ValueShareWith {
  String? id;
  String? email;
  String? phone;
  String? fullName;
  bool? isActive;
  int? departmentID;
  ValueShareWith({
    this.id,
    this.email,
    this.phone,
    this.fullName,
    this.isActive,
    this.departmentID,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'phone': phone,
      'fullName': fullName,
      'isActive': isActive,
      'departmentID': departmentID,
    };
  }

  factory ValueShareWith.fromMap(Map<String, dynamic> map) {
    return ValueShareWith(
      id: map['id'] != null ? map['id'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      isActive: map['isActive'] != null ? map['isActive'] as bool : null,
      departmentID:
          map['departmentID'] != null ? map['departmentID'] as int : null,
    );
  }
}

class SharedWith {
  int? id;
  String? type;
  String? scope;
  ValueShareWith? shareWith;
  String? expiration;
  SharedWith({
    this.id,
    this.type,
    this.scope,
    this.shareWith,
    this.expiration,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'scope': scope,
      'shareWidth': shareWith?.toMap(),
      'expiration': expiration
    };
  }

  factory SharedWith.fromMap(Map<String, dynamic> map) {
    return SharedWith(
      id: map['id'] != null ? map['id'] as int : null,
      type: map['type'] != null ? map['type'] as String : null,
      scope: map['scope'] != null ? map['scope'] as String : null,
      shareWith: map['sharedWith'] != null
          ? ValueShareWith.fromMap(map['sharedWith'] as Map<String, dynamic>)
          : null,
      expiration:
          map['expiration'] != null ? map['expiration'] as String : null,
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
  String? owerID;
  String? accessScope;
  String? targetAccessScope;
  String? lastModified;
  List<Tags>? tags;
  bool? isArchived;
  bool? isBackup;
  List<SharedWith>? shareWith;
  ResultItemFolder(
      {this.id,
      this.name,
      this.nameWithExtension,
      this.type,
      this.size,
      this.isLocked,
      this.isShortcut,
      this.isUploading,
      this.owerID,
      this.accessScope,
      this.targetAccessScope,
      this.lastModified,
      this.tags,
      this.isArchived,
      this.isBackup,
      this.shareWith});

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
      'ownerID': owerID,
      'accessScope': accessScope,
      'targetAccessScope': targetAccessScope,
      'lastModified': lastModified,
      'tags': tags?.map((e) => e.toMap()).toList(),
      'isArchived': isArchived,
      'isBackup': isBackup,
      'shareWith': shareWith?.map((e) => e.toMap()).toList(),
    };
  }

  factory ResultItemFolder.fromJson(Map<String, dynamic> map) {
    return ResultItemFolder(
        id: map['id'] != null ? map['id'] as String : null,
        name: map['name'] != null ? map['name'] as String : null,
        nameWithExtension: map['nameWithExtension'] != null
            ? map['nameWithExtension'] as String
            : null,
        type: map['type'] != null ? map['type'] as String : null,
        size: map['size'] != null ? map['size'] as int : null,
        isLocked: map['isLocked'] != null ? map['isLocked'] as bool : null,
        isShortcut:
            map['isShortcut'] != null ? map['isShortcut'] as bool : null,
        isUploading:
            map['isUploading'] != null ? map['isUploading'] as bool : null,
        owerID: map['owerID'] != null ? map['isUploading'] as String : null,
        accessScope:
            map['accessScope'] != null ? map['accessScope'] as String : null,
        targetAccessScope: map['targetAccessScope'] != null
            ? map['targetAccessScope'] as String
            : null,
        lastModified:
            map['lastModified'] != null ? map['lastModified'] as String : null,
        tags: map['tags'] != null
            ? List<Tags>.from((map['tags'] as List<dynamic>)
                .map<Tags>((e) => Tags.fromMap(e as Map<String, dynamic>)))
            : null,
        isArchived:
            map['isArchived'] != null ? map['isArchived'] as bool : null,
        isBackup: map['isBackup'] != null ? map['isBackup'] as bool? : null,
        shareWith: map['shareWith'] != null
            ? List<SharedWith>.from((map['shareWith'] as List<dynamic>)
                .map<SharedWith>(
                    (e) => SharedWith.fromMap(e as Map<String, dynamic>)))
            : null);
  }
}
