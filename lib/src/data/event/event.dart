class Event {
  String? accountID;
  String? content;
  String? createdAt;
  int? id;
  String? type;
  String? username;
  String? fullName;
  Event(
      {this.accountID,
      this.content,
      this.createdAt,
      this.id,
      this.type,
      this.username,
      this.fullName});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountID': accountID,
      'content': content,
      'createdAt': createdAt,
      'id': id,
      'type': type,
      'username': username,
      'fullName': fullName
    };
  }

  factory Event.fromMap(Map<String, dynamic> json) {
    return Event(
        fullName: json['fullName'] != null ? json['fullName'] as String : null,
        accountID:
            json['accountID'] != null ? json['accountID'] as String : null,
        content: json['content'] != null ? json['content'] as String : null,
        createdAt:
            json['createdAt'] != null ? json['createdAt'] as String : null,
        id: json['id'] != null ? json['id'] as int : null,
        type: json['type'] != null ? json['type'] as String : null,
        username: json['username'] != null ? json['username'] as String : null);
  }
}
