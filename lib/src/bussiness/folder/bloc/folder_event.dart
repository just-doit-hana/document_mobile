import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FolderEvent extends Equatable {
  const FolderEvent();
}

class LoadFolderPublicEvent extends FolderEvent {
  @override
  List<Object?> get props => [];
}
