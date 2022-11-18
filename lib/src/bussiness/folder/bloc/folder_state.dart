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

class FolderRecycleLoaded extends FolderState {
  final FolderRecycleReponse recycleBin;
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

class FolderBackupLoading extends FolderState {
  @override
  List<Object?> get props => [];
}

class FolderBackupLoaded extends FolderState {
  final FolderRecycleReponse folderBackup;
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
