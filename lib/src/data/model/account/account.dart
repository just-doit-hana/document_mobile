import 'package:document_mobile/src/data/model/role/role.dart';

class Account {
  String? id;
  String? email;
  String? phone;
  String? fullName;
  bool? isActive;
  int? departmentID;
  String? department;
  List<Role>? role;
  Account({
    this.id,
    this.email,
    this.phone,
    this.fullName,
    this.isActive,
    this.departmentID,
    this.department,
    this.role,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'phone': phone,
      'fullName': fullName,
      'isActive': isActive,
      'departmentID': departmentID,
      'department': department,
      'role': role?.map((e) => e.toMap()).toList(),
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
        id: map['id'] != null ? map['id'] as String : null,
        email: map['email'] != null ? map['email'] as String : null,
        phone: map['phone'] != null ? map['phone'] as String : null,
        fullName: map['fullName'] != null ? map['fullName'] as String : null,
        isActive: map['isActive'] != null ? map['isActive'] as bool : null,
        departmentID:
            map['departmentID'] != null ? map['departmentID'] as int : null,
        department:
            map['department'] != null ? map['department'] as String : null,
        role: map['role'] != null
            ? List<Role>.from(map['role'].map((e) => Role.fromMap(e)))
            : null);
  }
}
