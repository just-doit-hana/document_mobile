// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserSeen {
  String accountID;
  String content;
  String createdAt;
  String fullName;
  String id;
  String type;
  String username;
  UserSeen({
    required this.accountID,
    required this.content,
    required this.createdAt,
    required this.fullName,
    required this.id,
    required this.type,
    required this.username,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountID': accountID,
      'content': content,
      'createdAt': createdAt,
      'fullName': fullName,
      'id': id,
      'type': type,
      'username': username
    };
  }

  factory UserSeen.fromMap(Map<String, dynamic> json) {
    return UserSeen(
        accountID: json['accountID'],
        content: json['content'],
        createdAt: json['createdAt'],
        fullName: json['fullName'],
        id: json['id'],
        type: json['type'],
        username: json['username']);
  }
}
