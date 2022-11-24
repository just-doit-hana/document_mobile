class Role {
  int? id;
  String? name;

  Role({this.id, this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name};
  }

  factory Role.fromMap(Map<String, dynamic> json) {
    return Role(
        id: json['id'] != null ? json['id'] as int : null,
        name: json['name'] != null ? json['name'] as String : null);
  }
}
