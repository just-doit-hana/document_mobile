class Tags {
  int? id;
  String? name;
  String? hexColor;
  Tags({this.id, this.name, this.hexColor});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'hexColor': hexColor};
  }

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hexColor = json['hexColor'];
  }
}
