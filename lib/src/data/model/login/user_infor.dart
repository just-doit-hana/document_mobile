class UserInfor {
  final String? userID;
  final String? username;
  final String? fullName;
  final String? sysToken;
  final int? sysTokenExpires;
  final String? dmsToken;
  final int? dmsTokenExpires;
  final String? refreshToken;
  final int? refreshTokenExpires;
  final List<String>? roles;
  UserInfor({
    this.userID,
    this.username,
    this.fullName,
    this.sysToken,
    this.sysTokenExpires,
    this.dmsToken,
    this.dmsTokenExpires,
    this.refreshToken,
    this.refreshTokenExpires,
    this.roles,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userID': userID,
      'username': username,
      'fullName': fullName,
      'sysToken': sysToken,
      'sysTokenExpires': sysTokenExpires,
      'dmsToken': dmsToken,
      'dmsTokenExpires': dmsTokenExpires,
      'refreshToken': refreshToken,
      'refreshTokenExpires': refreshTokenExpires,
      'roles': roles,
    };
  }

  factory UserInfor.fromMap(Map<String, dynamic> map) {
    return UserInfor(
      userID: map['userID'] != null ? map['userID'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      sysToken: map['sysToken'] != null ? map['sysToken'] as String : null,
      sysTokenExpires:
          map['sysTokenExpires'] != null ? map['sysTokenExpires'] as int : null,
      dmsToken: map['dmsToken'] != null ? map['dmsToken'] as String : null,
      dmsTokenExpires:
          map['dmsTokenExpires'] != null ? map['dmsTokenExpires'] as int : null,
      refreshToken:
          map['refreshToken'] != null ? map['refreshToken'] as String : null,
      refreshTokenExpires: map['refreshTokenExpires'] != null
          ? map['refreshTokenExpires'] as int
          : null,
      // roles: map['roles'] != null
      //     ? List.from((map['roles']))
      //     : null,
    );
  }
}
