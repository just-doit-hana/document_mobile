import '../tags/tags.dart';

class FolderRestoreResponse {
  RestoreFolder? restoreFolder;
  int? statusCode;
  bool? isError;
  String? message;
  FolderRestoreResponse(
      {this.restoreFolder, this.statusCode, this.isError, this.message});

  FolderRestoreResponse.fromJson(Map<String, dynamic> json) {
    restoreFolder = RestoreFolder.fromJson(json['result']);
    statusCode = json['statusCode'];
    isError = json['isError'];
    message = json['message'];
  }
}

class RestoreFolder {
  String? id;
  String? name;
  String? description;
  int? size;
  String? type;
  String? ownerID;
  String? activities;
  List<Tags>? tags;
  String? lastModified;
  String? lastVersionID;
  bool? isShortcut;
  String? targetFileID;
  String? targetFile;
  String? prevParentFolderID;
  String? parentFolderID;
  RestoreFolder({
    this.id,
    this.name,
    this.description,
    this.size,
    this.type,
    this.ownerID,
    this.activities,
    this.tags,
    this.lastModified,
    this.lastVersionID,
    this.isShortcut,
    this.targetFileID,
    this.targetFile,
    this.prevParentFolderID,
    this.parentFolderID,
  });

  RestoreFolder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    size = json['size'];
    type = json['type'];
    ownerID = json['ownerID'];
    activities = json['activities'];
    json['tags'].forEach((t) {
      tags = <Tags>[];
      tags!.add(Tags.fromJson(t));
    });
    lastModified = json['lastModifiled'];
    lastVersionID = json['lastVersionID'];
    isShortcut = json['isShortcut'];
    targetFileID = json['targetFileID'];
    targetFile = json['targetFile'];
    prevParentFolderID = json['prevParentFolderID'];
    parentFolderID = json['parentFolderID'];
  }
}
