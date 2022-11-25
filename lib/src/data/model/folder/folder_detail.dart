import 'package:document_mobile/src/data/event/event.dart';

class FolderDetailResponse {
  String? isError;
  String? message;
  String? statusCode;
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
      'event': event!.map((e) => e.toMap()).toList()
    };
  }

  factory FolderDeTail.fromMap(Map<String, dynamic> json) {
    return FolderDeTail(
        id: json['id'],
        lastModified: json['lastModified'],
        name: json['name'],
        ownerID: json['ownerID'],
        ownerName: json['ownerName'],
        targetFolder: json['targetFolder'],
        targetFolderID: json['targetFolderID'],
        event: List<Event>.from(json['event'].map((e) => Event.fromMap(e)))
            .toList());
  }
}
