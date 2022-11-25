import 'dart:convert';

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
        accountID: json['accountID'],
        content: json['content'],
        createdAt: json['createdAt'],
        id: json['id'],
        type: json['type'],
        username: json['username']);
  }
}
