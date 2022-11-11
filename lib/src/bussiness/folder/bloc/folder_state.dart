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

class FolderPrivateLoadingState extends FolderState {
  @override
  List<Object?> get props => [];
}

class FolderPrivateLoadedState extends FolderState {
  final Result privateFolder;
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
  final String id;
  final FolderItemResponse resultItemFolder;

  FolderItemLoaded({required this.id, required this.resultItemFolder});

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
