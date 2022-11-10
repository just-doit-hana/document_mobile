// ignore_for_file: public_member_api_docs, sort_constructors_first

class FolderItemResponse {
  Pagination? pagination;
  List<ResultItemFolder>? result;
  int? statusCode;
  bool? isError;
  String? message;
  FolderItemResponse({
    this.pagination,
    this.result,
    this.statusCode,
    this.isError,
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
      pagination: map['pagination'] != null ? Pagination.fromMap(map['pagination'] as Map<String,dynamic>) : null,
      result: map['result'] != null ? List<ResultItemFolder>.from((map['result'] as List<int>).map<ResultItemFolder?>((x) => ResultItemFolder.fromMap(x as Map<String,dynamic>),),) : null,
      statusCode: map['statusCode'] != null ? map['statusCode'] as int : null,
      isError: map['isError'] != null ? map['isError'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory FolderItemResponse.fromJson(String source) => FolderItemResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Pagination {
  int? totalCount;
  int? maxPageSize;
  int? currentPage;
  int? totalPages;
  bool hasNext;
  bool hasPrevious;
  Pagination({
    this.totalCount,
    this.maxPageSize,
    this.currentPage,
    this.totalPages,
    this.hasNext = false,
    this.hasPrevious = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalCount': totalCount,
      'maxPageSize': maxPageSize,
      'currentPage': currentPage,
      'totalPages': totalPages,
      'hasNext': hasNext,
      'hasPrevious': hasPrevious
    };
  }

  factory Pagination.fromMap(Map<String, dynamic> map) {
    return Pagination(
      totalCount: map['totalCount'] != null ? map['toltalCount'] as int : null,
      maxPageSize:
          map['maxPageSize'] != null ? map['maxPageSize'] as int : null,
      currentPage:
          map['currentPage'] != null ? map['currentPage'] as int : null,
      totalPages: map['totalPages'] != null ? map['totalPages'] as int : null,
      hasNext: map['hasNext'] as bool,
      hasPrevious: map['hasPrevious'] as bool,
    );
  }
  // String toJson() => json.encode(toMap());

  // factory Pagination.fromJson(String source) =>
  //     Pagination.fromMap(json.decode(source) as Map<String, dynamic>);
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

  // String toJson() => json.encode(toMap());

  // factory ValueShareWith.fromJson(String source) =>
  //     ValueShareWith.fromMap(json.decode(source) as Map<String, dynamic>);
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

  // String toJson() => json.encode(toMap());

  // factory SharedWith.fromJson(String source) =>
  //     SharedWith.fromMap(json.decode(source) as Map<String, dynamic>);
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
            ? List<Tags>.from((map['tags'] as List<int>)
                .map<Tags>((e) => Tags.fromMap(e as Map<String, dynamic>)))
            : null,
        isArchived:
            map['isArchived'] != null ? map['isArchived'] as bool : null,
        isBackup: map['isBackup'] != null ? map['isBackup'] as bool? : null,
        shareWith: map['shareWith'] != null
            ? List<SharedWith>.from((map['shareWith'] as List<int>)
                .map<SharedWith>(
                    (e) => SharedWith.fromMap(e as Map<String, dynamic>)))
            : null);
  }
  // String toJson() => json.encode(toMap());

  // factory ResultItemFolder.fromJson(String source) => ResultItemFolder.fromMap(json.decode(source) as Map<String, dynamic>);
}
