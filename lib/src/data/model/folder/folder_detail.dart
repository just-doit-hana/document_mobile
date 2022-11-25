import 'package:document_mobile/src/data/event/event.dart';

class FolderDetailResponse {
  bool? isError;
  String? message;
  int? statusCode;
  FolderDeTail? folderDeTail;
  FolderDetailResponse({
    this.isError,
    this.message,
    this.statusCode,
    this.folderDeTail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isError': isError,
      'message': message,
      'statusCode': statusCode,
      'result': folderDeTail!.toMap(),
    };
  }

  factory FolderDetailResponse.fromMap(Map<String, dynamic> json) {
    return FolderDetailResponse(
        isError: json['isError'],
        message: json['message'],
        statusCode: json['statusCode'],
        folderDeTail: FolderDeTail.fromMap(json['result']));
  }
}

class FolderDeTail {
  List<Event>? event;
  String? id;
  String? lastModified;
  String? name;
  String? ownerID;
  String? ownerName;
  String? targetFolder;
  String? targetFolderID;
  FolderDeTail({
    this.event,
    this.id,
    this.lastModified,
    this.name,
    this.ownerID,
    this.ownerName,
    this.targetFolder,
    this.targetFolderID,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'lastModified': lastModified,
      'name': name,
      'ownerID': ownerID,
      'ownerName': ownerName,
      'targetFolder': targetFolder,
      'targetFolderID': targetFolderID,
      'activities': event!.map((e) => e.toMap()).toList()
    };
  }

  factory FolderDeTail.fromMap(Map<String, dynamic> json) {
    return FolderDeTail(
        id: json['id'] != null ? json['id'] as String : null,
        lastModified: json['lastModified'] != null
            ? json['lastModified'] as String
            : null,
        name: json['name'] != null ? json['name'] as String : null,
        ownerID: json['ownerID'] != null ? json['ownerID'] as String : null,
        ownerName:
            json['ownerName'] != null ? json['ownerName'] as String : null,
        targetFolder: json['targetFolder'] != null
            ? json['targetFolder'] as String
            : null,
        targetFolderID: json['targetFolderID'] != null
            ? json['targetFolderID'] as String
            : null,
        event: json['activities'] != null
            ? List<Event>.from(json['activities'].map((e) => Event.fromMap(e)))
            : []);
  }
}
