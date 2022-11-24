// ignore_for_file: public_member_api_docs, sort_constructors_first
class VersionFile {
  String id;
  String fileName;
  int size;
  String type;
  String extensions;
  bool isReady;
  String uploadedAt;
  String uploaderID;
  String uploaderFullName;
  VersionFile({
    required this.id,
    required this.fileName,
    required this.size,
    required this.type,
    required this.extensions,
    required this.isReady,
    required this.uploadedAt,
    required this.uploaderID,
    required this.uploaderFullName,
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
        id: map['id'],
        fileName: map['fileName'],
        size: map['size'],
        type: map['type'],
        extensions: map['extensions'],
        isReady: map['isReady'],
        uploadedAt: map['uploadedAt'],
        uploaderID: map['uploaderID'],
        uploaderFullName: map['uploaderFullName']);
  }
}
