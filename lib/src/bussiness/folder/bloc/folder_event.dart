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
  LoadFolderItemEvent({
    this.id,
  });
  @override
  List<Object?> get props => [id];
}
