// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:document_mobile/src/data/event/event.dart';

import '../tags/tags.dart';

class FileDetailResponse {
  bool? isError;
  String? message;
  int? statusCode;
  FileDetails fileDetail;
  FileDetailResponse({
    this.isError,
    this.message,
    this.statusCode,
    required this.fileDetail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isError': isError,
      'message': message,
      'statusCode': statusCode,
      'result': fileDetail.toMap(),
    };
  }

  factory FileDetailResponse.fromMap(Map<String, dynamic> json) {
    return FileDetailResponse(
        isError: json['isError'],
        message: json['message'],
        statusCode: json['statusCode'],
        fileDetail: FileDetails.fromMap(json['result']));
  }
}

class FileDetails {
  String? id;
  String? name;
  String? type;
  int? size;
  bool? isShortcut;
  String? ownerID;
  String? lastModified;
  List<Event>? event;
  List<Tags>? tags;
  String? parentFolderID;
  String? lastVersionID;
  String? prevParentFolderID;
  String? targetFile;
  String? targetFileID;
  String? description;
  FileDetails({
    this.id,
    this.name,
    this.type,
    this.size,
    this.isShortcut,
    this.ownerID,
    this.lastModified,
    this.event,
    this.tags,
    this.parentFolderID,
    this.lastVersionID,
    this.prevParentFolderID,
    this.targetFile,
    this.targetFileID,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'size': size,
      'isShortcut': isShortcut,
      'ownerID': ownerID,
      'lastModified': lastModified,
      'activities': event!.map((x) => x.toMap()).toList(),
      'tags': tags!.map((x) => x.toMap()).toList(),
      'parentFolderID': parentFolderID,
      'lastVersionID': lastVersionID,
      'prevParentFolderID': prevParentFolderID,
      'targetFile': targetFile,
      'targetFileID': targetFileID,
      'description': description
    };
  }

  factory FileDetails.fromMap(Map<String, dynamic> map) {
    return FileDetails(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      size: map['size'] != null ? map['size'] as int : null,
      isShortcut: map['isShortcut'] != null ? map['isShortcut'] as bool : null,
      ownerID: map['ownerID'] != null ? map['ownerID'] as String : null,
      lastModified:
          map['lastModified'] != null ? map['lastModified'] as String : null,
      event: List<Event>.from(
        map['activities'].map(
          (x) => Event.fromMap(x),
        ),
      ),
      tags: List<Tags>.from(map['tags'].map((e) => Tags.fromJson(e))),
      parentFolderID: map['parentFolderID'] != null
          ? map['parentFolderID'] as String
          : null,
      lastVersionID:
          map['lastVersionID'] != null ? map['lastVersionID'] as String : null,
      prevParentFolderID: map['prevParentFolderID'] != null
          ? map['prevParentFolderID'] as String
          : null,
      targetFile:
          map['targetFile'] != null ? map['targetFile'] as String : null,
      targetFileID:
          map['targetFileID'] != null ? map['targetFileID'] as String : null,
    );
  }
}
