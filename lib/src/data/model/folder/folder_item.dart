import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FolderItemResponse {
  Pagination? pagination;
  List<ResultItem>? result;
  int? statusCode;
  bool? isError;
  String? message;
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

  factory SharedWith.fromMapp(Map<String, dynamic> map) {
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

class ResultItem {
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
}
