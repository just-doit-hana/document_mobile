// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class AppResponse<T> extends Equatable {
  /// The boolean indicates the AppResponse is success or failed
  final bool success;

  /// The message of AppResponse description
  final String message;

  /// The AppResponse data
  final T? data;

  final int statusCode;

  final String statusMessage;
  const AppResponse({
    required this.success,
    required this.message,
    this.data,
    this.statusCode = 200,
    this.statusMessage = 'The request success',
  });
  AppResponse<T> copyWith({
    bool? success,
    String? message,
    T? data,
    int? statusCode,
    String? statusMessage,
  }) {
    return AppResponse<T>(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
      statusCode: statusCode ?? this.statusCode,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'message': message,
      'data': data,
      'statusCode': statusCode,
      'statusMessage': statusMessage,
    };
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      success,
      message,
      data ?? '',
      statusCode,
      statusMessage,
    ];
  }

  factory AppResponse.fromMap(Map<String, dynamic> map) {
    return AppResponse<T>(
      success: map['success'] as bool,
      message: map['message'] as String,
      data: map['data'],
      statusCode: map['statusCode'] as int,
      statusMessage: map['statusMessage'] as String,
    );
  }

  factory AppResponse.fromJson(String source, Function(dynamic json) param1) =>
      AppResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
