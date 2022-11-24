class LoginUser {
  final String username;
  final String password;
  LoginUser({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  // factory LoginUser.fromMap(Map<String, dynamic> map) {
  //   return LoginUser(
  //     username: map['username'] as String,
  //     password: map['password'] as String,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory LoginUser.fromJson(String source) =>
  //     LoginUser.fromMap(json.decode(source) as Map<String, dynamic>);

  // LoginUser copyWith({
  //   String? username,
  //   String? password,
  // }) {
  //   return LoginUser(
  //     username: username ?? this.username,
  //     password: password ?? this.password,
  //   );
  // }
}
