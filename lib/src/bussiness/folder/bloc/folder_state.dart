// ignore_for_file: public_member_api_docs, sort_constructors_first
part of './folder_bloc.dart';

@immutable
abstract class FolderState extends Equatable {}

class FolderLoadingState extends FolderState {
  @override
  List<Object?> get props => [];
}

class FolderLoadedState extends FolderState {
  final Result folder;
  FolderLoadedState({required this.folder});
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

class FolderPrivateLoadingState extends FolderState {
  @override
  List<Object?> get props => [];
}

class FolderPrivateLoadedState extends FolderState {
  final FolderItemResponse privateFolder;
  FolderPrivateLoadedState({required this.privateFolder});

  @override
  List<Object?> get props => [privateFolder];
}

class FolderPrivateErrorState extends FolderState {
  final String error;
  FolderPrivateErrorState(
    this.error,
  );
  @override
  List<Object?> get props => [error];
}

class FolderItemLoading extends FolderState {
  @override
  List<Object?> get props => [];
}

class FolderItemLoaded extends FolderState {
  final String? id;
  final FolderItemResponse? resultItemFolder;

  FolderItemLoaded(this.id, this.resultItemFolder);

  @override
  List<Object?> get props => [id, resultItemFolder];
}

class FolderItemErrorState extends FolderState {
  final String error;
  FolderItemErrorState(
    this.error,
  );
  @override
  List<Object?> get props => [error];
}

class FolderRecycleLoading extends FolderState {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class FolderRecycleLoaded extends FolderState {
  final FolderItemResponse recycleBin;
  int? page;
  bool? isLastPage;
  FolderRecycleLoaded(
      {required this.recycleBin, this.page = 1, this.isLastPage = false});
  @override
  List<Object?> get props => [recycleBin];

  bool get hasRecycle => recycleBin.result!.isNotEmpty;
}

class FolderRecyleError extends FolderState {
  final String error;
  FolderRecyleError(
    this.error,
  );
  @override
  List<Object?> get props => [error];
}

class DeleteRecycleBinFolderLoading extends FolderState {
  @override
  List<Object?> get props => [];
}

class DeleteRecycleBinFolderLoaded extends FolderState {
  final String id;
  DeleteRecycleBinFolderLoaded({required this.id});

  @override
  List<Object?> get props => [id];
}

class DeleteRecycleFolderError extends FolderState {
  final String error;
  DeleteRecycleFolderError({required this.error});

  @override
  List<Object?> get props => [error];
}

class DeleteRecycleBinFileLoading extends FolderState {
  @override
  List<Object?> get props => [];
}

class DeleteRecycleBinFileLoaded extends FolderState {
  final String id;
  DeleteRecycleBinFileLoaded({required this.id});

  @override
  List<Object?> get props => [id];
}

class DeleteRecycleFileError extends FolderState {
  final String error;
  DeleteRecycleFileError({required this.error});

  @override
  List<Object?> get props => [error];
}

class RestoreRecycleBinFolderLoading extends FolderState {
  @override
  List<Object?> get props => [];
}

class RestoreRecycleBinFolderLoaded extends FolderState {
  final FolderRestoreResponse? folderRestoreResponse;
  RestoreRecycleBinFolderLoaded({this.folderRestoreResponse});

  @override
  List<Object?> get props => [folderRestoreResponse];
}

class RestoreRecycleBinFolderError extends FolderState {
  final String error;
  RestoreRecycleBinFolderError({required this.error});

  @override
  List<Object?> get props => [error];
}

class RestoreRecycleBinFileLoading extends FolderState {
  @override
  List<Object?> get props => [];
}

class RestoreRecycleBinFileLoaded extends FolderState {
  // final String id;
  final FolderRestoreResponse folderRestoreResponse;
  RestoreRecycleBinFileLoaded({required this.folderRestoreResponse});

  @override
  List<Object?> get props => [folderRestoreResponse];
}

class RestoreRecycleBinFileError extends FolderState {
  final String error;
  RestoreRecycleBinFileError({required this.error});

  @override
  List<Object?> get props => [error];
}

class RestoreBackupLoading extends FolderState {
  @override
  List<Object?> get props => [];
}

class RestoreBackupLoaded extends FolderState {
  final FolderRestoreResponse folderRestoreBackupResponse;
  RestoreBackupLoaded({required this.folderRestoreBackupResponse});

  @override
  List<Object?> get props => [folderRestoreBackupResponse];
}

class RestoreBackupError extends FolderState {
  final String error;
  RestoreBackupError({required this.error});
  @override
  List<Object?> get props => [error];
}

class FolderBackupLoading extends FolderState {
  @override
  List<Object?> get props => [];
}

class FolderBackupLoaded extends FolderState {
  final FolderItemResponse folderBackup;
  FolderBackupLoaded(this.folderBackup);
  @override
  List<Object?> get props => [folderBackup];
}

class FolderBackupError extends FolderState {
  final String error;
  FolderBackupError(this.error);

  @override
  List<Object?> get props => [error];
}

class ListShareLoadingState extends FolderState {
  @override
  List<Object?> get props => [];
}

class ListShareLoadedState extends FolderState {
  final FolderItemResponse sharefile;
  ListShareLoadedState({required this.sharefile});

  @override
  List<Object?> get props => [sharefile];
}

class ListShareErrorState extends FolderState {
  final String error;
  ListShareErrorState(
    this.error,
  );
  @override
  List<Object?> get props => [error];
}

class ViewDetailLoadingState extends FolderState {
  @override
  List<Object?> get props => [];
}

class ViewDetaiFolderlLoadedState extends FolderState {
  final FolderDetailResponse folderDetailResponse;
  ViewDetaiFolderlLoadedState({required this.folderDetailResponse});

  @override
  List<Object?> get props => [folderDetailResponse];
}

class ViewDetailFolderErrorState extends FolderState {
  final String error;
  ViewDetailFolderErrorState({required this.error});

  @override
  List<Object?> get props => throw [error];
}

class ArchiveFolderLoadingState extends FolderState {
  @override
  List<Object?> get props => [];
}

class ArchiveFolderLoadedState extends FolderState {
  final String fileId;

  ArchiveFolderLoadedState({required this.fileId});
  @override
  List<Object?> get props => [fileId];
}

class ArchiveFolderErrorState extends FolderState {
  final String error;
  ArchiveFolderErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}

class FolderRenameLoadingState extends FolderState {
  @override
  List<Object?> get props => [];
}

class FolderRenameLoadedState extends FolderState {
  final String folderId;
  final String name;

  FolderRenameLoadedState({required this.folderId, required this.name});
  @override
  List<Object?> get props => [folderId];
}

class FolderRenameErrorState extends FolderState {
  final String error;
  FolderRenameErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}


// class DomainLoading extends FolderState {
//   @override
//   List<Object?> get props => [];
// }

// class DomainLoaded extends FolderState {
//   final List<TestNoMap>? domain;

//   DomainLoaded(this.domain);

//   @override
//   List<Object?> get props => [domain];
// }

// class DomainErrorState extends FolderState {
//   final String error;
//   DomainErrorState(
//     this.error,
//   );
//   @override
//   List<Object?> get props => [error];
// }
