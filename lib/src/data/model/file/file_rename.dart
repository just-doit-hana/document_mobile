class FileRename {
  List<int>? tagsId;
  String? description;
  String? name;
  FileRename({
    this.tagsId,
    this.description,
    this.name,
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
      tagsId: map['tagIDs'] != null ? List<int>.from(map['tagIDs']) : [],
      description:
          map['description'] != null ? map['description'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }
}
