// ignore_for_file: public_member_api_docs, sort_constructors_first
class VersionFile {
  String? id;
  String? fileName;
  int? size;
  String? type;
  String? extensions;
  bool? isReady;
  String? uploadedAt;
  String? uploaderID;
  String? uploaderFullName;
  VersionFile({
    this.id,
    this.fileName,
    this.size,
    this.type,
    this.extensions,
    this.isReady,
    this.uploadedAt,
    this.uploaderID,
    this.uploaderFullName,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fileName': fileName,
      'size': size,
      'type': type,
      'extension': extensions,
      'isReady': isReady,
      'uploadedAt': uploadedAt,
      'uploaderID': uploaderID,
      'uploaderFullName': uploaderFullName
    };
  }

  factory VersionFile.fromMap(Map<String, dynamic> map) {
    return VersionFile(
        id: map['id'] != null ? map['id'] as String : null,
        fileName: map['fileName'] != null ? map['fileName'] as String : null,
        size: map['size'] != null ? map['size'] as int : null,
        type: map['type'] != null ? map['type'] as String : null,
        extensions:
            map['extensions'] != null ? map['extensions'] as String : null,
        isReady: map['isReady'] != null ? map['isReady'] as bool : null,
        uploadedAt:
            map['uploadedAt'] != null ? map['uploadedAt'] as String : null,
        uploaderID:
            map['uploaderID'] != null ? map['uploaderID'] as String : null,
        uploaderFullName: map['uploaderFullName'] != null
            ? map['uploaderFullName'] as String
            : null);
  }
}
