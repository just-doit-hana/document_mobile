class FolderModel {
  final int id;
  final String email;
  final String firstName;
  final String lastname;
  final String avatar;

  FolderModel(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastname,
      required this.avatar});

  factory FolderModel.fromJson(Map<String, dynamic> json) {
    return FolderModel(
        id: json['id'],
        email: json['email'],
        firstName: json['first_name'] ?? 'First Name',
        lastname: json['last_name'] ?? 'Last Name',
        avatar: json['avatar']);
  }
}
