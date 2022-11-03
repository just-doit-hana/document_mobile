// import 'package:document_appmobile/src/data/model/folder/folder.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';

part of './folder_bloc.dart';

@immutable
abstract class FolderState extends Equatable {}

class FolderLoadingState extends FolderState {
  @override
  List<Object?> get props => [];
}

class FolderLoadedState extends FolderState {
  final Result folder;
  FolderLoadedState(
    this.folder,
  );
  @override
  List<Object?> get props => [folder];
}

class FolderErrorState extends FolderState {
  final String error;
  FolderErrorState(
    this.error,
  );
  @override
  List<Object?> get props => [error];
}
