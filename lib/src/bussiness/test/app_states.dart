// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:document_appmobile/src/data/model/folder/folder.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/repository/folder/folder_model.dart';

@immutable
abstract class UserState extends Equatable {}

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  final List<FolderResponse> folder;
  UserLoadedState(
    this.folder,
  );
  @override
  List<Object?> get props => [folder];
}

class UserErrorState extends UserState {
  final String error;
  UserErrorState(
    this.error,
  );
  @override
  List<Object?> get props => [error];
}
