// ignore_for_file: public_member_api_docs, sort_constructors_first
part of './folder_bloc.dart';

@immutable
abstract class FolderEvent extends Equatable {
  const FolderEvent();
}

class LoadFolderPublicEvent extends FolderEvent {
  @override
  List<Object?> get props => [];
}

class LoadFolderPrivateEvent extends FolderEvent {
  @override
  List<Object?> get props => [];
}

class LoadFolderItemEvent extends FolderEvent {
  final String? id;
  final FolderItemResponse? resultItemFolder;

  const LoadFolderItemEvent({this.id, this.resultItemFolder});
  @override
  List<Object?> get props => [id, resultItemFolder];
}

class LoadFolderRecycleBinEvent extends FolderEvent {
  @override
  List<Object?> get props => [];
}

class DomainEvent extends FolderEvent {
  @override
  List<Object?> get props => [];
}
