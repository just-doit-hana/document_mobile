import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String name;
  final String email;
  final String gender;
  final String status;

  const User(
    this.id,
    this.name,
    this.email,
    this.gender,
    this.status,
  );

  @override
  List<Object> get props {
    return [
      id ?? 0,
      name,
      email,
      gender,
      status,
    ];
  }

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? gender,
    String? status,
  }) {
    return User(
      id ?? this.id,
      name ?? this.name,
      email ?? this.email,
      gender ?? this.gender,
      status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'gender': gender,
      'status': status,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['id'] != null ? map['id'] as int : null,
      map['name'] as String,
      map['email'] as String,
      map['gender'] as String,
      map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
