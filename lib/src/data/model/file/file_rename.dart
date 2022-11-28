class FileRename {
  List<dynamic> tagsId;
  String description;
  String name;
  FileRename({
    required this.tagsId,
    required this.description,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tagIDs': tagsId,
      'description': description,
      'name': name,
    };
  }

  factory FileRename.fromMap(Map<String, dynamic> map) {
    return FileRename(
      tagsId: List<dynamic>.from(map['tagIDs']),
      description: map['description'],
      name: map['name'],
    );
  }
}
