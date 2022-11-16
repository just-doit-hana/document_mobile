class FolderItemResponse {
  Pagination? pagination;
  late List<ResultItemFolder> result;
  int? statusCode;
  bool? isError;
  String? message;
  FolderItemResponse({
    required this.pagination,
    this.result = const <ResultItemFolder>[],
    required this.statusCode,
    this.isError = true,
    required this.message,
  });

  FolderItemResponse.fromJson(Map<String, dynamic> json) {
    pagination = Pagination.fromMap(json['pagination']);
    statusCode = json['statusCode'] ?? '';
    isError = json['isError'] ?? false;
    message = json['message'] ?? '';
    // if (json['result'] != null) {
    json['result'].forEach((v) {
      result = <ResultItemFolder>[];
      result.add(ResultItemFolder.fromJson(v));
    });
    // }
  }
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

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    hexColor = json['hexColor'] ?? '';
  }
}

class ValueShareWith {
  String? id;
  String? email;
  String? phone;
  String? fullName;
  bool? isActive;
  int? departmentID;
  ValueShareWith(
    param0, {
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

  ValueShareWith.fromMap(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    email = json['email'] ?? '';
    phone = json['phone'] ?? '';
    fullName = json['fullName'] ?? '';
    isActive = json['isActive'];
    departmentID = json['departmentID'];
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

  SharedWith.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    type = map['type'];
    scope = map['scope'];
    shareWith = ValueShareWith.fromMap(map['sharedWith']);
    expiration = map['expiration'];
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
  ResultItemFolder(
      {this.id,
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
      this.tags,
      this.isArchived,
      this.isBackup,
      this.sharedWith});

  // Map<String, dynamic> toJson() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'name': name,
  //     'nameWithExtension': nameWithExtension,
  //     'type': type,
  //     'size': size,
  //     'isLocked': isLocked,
  //     'isShortcut': isShortcut,
  //     'isUploading': isUploading,
  //     'ownerID': owerID,
  //     'accessScope': accessScope,
  //     'targetAccessScope': targetAccessScope,
  //     'lastModified': lastModified,
  //     'tags': tags?.map((e) => e.toMap()).toList(),
  //     'isArchived': isArchived,
  //     'isBackup': isBackup,
  //     'shareWith': shareWith?.map((e) => e.toMap()).toList(),
  //   };
  // }

  ResultItemFolder.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    nameWithExtension = map['nameWithExtension'];
    type = map['type'];
    size = map['size'];
    isLocked = map['isLocked'];
    isShortcut = map['isShortcut'];
    isUploading = map['isUploading'];
    ownerID = map['ownerID'];
    accessScope = map['accessScope'];
    targetAccessScope = map['targetAccessScope'];
    lastModified = map['lastModified'];
    if (map['tags'] != null) {
      map['tags'].forEach((tags) {
        tags = <Tags>[];
        tags.add(Tags.fromJson(tags));
      });
    }
    isArchived = map['isArchived'];
    isBackup = map['isBackup'];
    if (map['shareWith'] != null) {
      map['sharedWith'].forEach((tags) {
        sharedWith = <SharedWith>[];
        sharedWith?.add(SharedWith.fromMap(tags));
      });
    }
  }
}
