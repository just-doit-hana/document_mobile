class ValueShareWith {
  String? id;
  String? email;
  String? phone;
  String? fullName;
  bool? isActive;
  int? departmentID;
  ValueShareWith({
    this.id,
    this.email,
    this.phone,
    this.fullName,
    this.isActive,
    this.departmentID,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'phone': phone,
      'fullName': fullName,
      'isActive': isActive,
      'departmentID': departmentID,
    };
  }

  factory ValueShareWith.fromMap(Map<String, dynamic> json) {
    return ValueShareWith(
      id: json['id'],
      email: json['email'],
      phone: json['phone'],
      fullName: json['fullName'],
      isActive: json['isActive'],
      departmentID: json['departmentID'],
    );
  }
}
