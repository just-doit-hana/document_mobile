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

class FolderPrivateSearchEvent extends FolderEvent {
  final String searchText;
  const FolderPrivateSearchEvent({required this.searchText});
  @override
  List<Object?> get props => [searchText];
}

class LoadFolderItemEvent extends FolderEvent {
  final String? id;
  final FolderItemResponse? resultItemFolder;

  const LoadFolderItemEvent({this.id, this.resultItemFolder});
  @override
  List<Object?> get props => [id, resultItemFolder];
}

// ignore: must_be_immutable
class LoadFolderRecycleBinEvent extends FolderEvent {
  // int page = 1;
  final List<ResultItemFolder>? recycleBinFolder;
  const LoadFolderRecycleBinEvent({this.recycleBinFolder});
  @override
  List<Object?> get props => [];
}

class LockFolderEvent extends FolderEvent {
  final String folderId;
  final bool isLock;
  const LockFolderEvent({required this.folderId, required this.isLock});

  @override
  List<Object?> get props => [folderId, isLock];
}

class LoadFolderBackupEvent extends FolderEvent {
  @override
  List<Object?> get props => [];
}

class RestoreRecycleBinFolderEvent extends FolderEvent {
  final String id;
  const RestoreRecycleBinFolderEvent({
    required this.id,
  });
  @override
  List<Object?> get props => [id];
}

class RestoreRecycleBinFileEvent extends FolderEvent {
  final String id;
  const RestoreRecycleBinFileEvent({
    required this.id,
  });
  @override
  List<Object?> get props => [id];
}

class DeleteRecycleBinFileEvent extends FolderEvent {
  final String id;
  const DeleteRecycleBinFileEvent({required this.id});
  @override
  List<Object?> get props => [id];
}

class DeleteRecycleBinFolderEvent extends FolderEvent {
  final String id;
  const DeleteRecycleBinFolderEvent({required this.id});
  @override
  List<Object?> get props => [id];
}

class RestoreBackupEvent extends FolderEvent {
  final String id;
  const RestoreBackupEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class ListShareFileEvent extends FolderEvent {
  @override
  List<Object?> get props => [];
}

class ViewDetailFolderEvent extends FolderEvent {
  final String folderId;
  const ViewDetailFolderEvent({
    required this.folderId,
  });

  @override
  List<Object?> get props => [folderId];
}

class ArchiveFolderEvent extends FolderEvent {
  final String fileId;
  const ArchiveFolderEvent({required this.fileId});

  @override
  List<Object?> get props => [fileId];
}

class FolderRenameEvent extends FolderEvent {
  final String folderId;
  final String name;

  const FolderRenameEvent(this.folderId, this.name);

  @override
  List<Object?> get props => [folderId, name];
}

class MoveToFolderEvent extends FolderEvent {
  final String folderId;
  final String destinationFolderId;
  const MoveToFolderEvent(
      {required this.folderId, required this.destinationFolderId});
  @override
  List<Object?> get props => [folderId, destinationFolderId];
}

class CopyToFolderEvent extends FolderEvent {
  final String folderId;
  final String destinationFolderId;
  const CopyToFolderEvent(
      {required this.folderId, required this.destinationFolderId});
  @override
  List<Object?> get props => [folderId, destinationFolderId];
}

class DomainEvent extends FolderEvent {
  @override
  List<Object?> get props => [];
}
