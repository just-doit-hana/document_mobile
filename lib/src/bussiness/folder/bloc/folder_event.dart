// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';

part of './folder_bloc.dart';

@immutable
abstract class FolderEvent extends Equatable {
  const FolderEvent();
}

class LoadFolderPublicEvent extends FolderEvent {
  @override
  List<Object?> get props => [];
}
