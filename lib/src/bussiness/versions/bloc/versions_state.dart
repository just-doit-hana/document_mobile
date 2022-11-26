part of 'versions_bloc.dart';

abstract class VersionsState extends Equatable {
  const VersionsState();
}

class VersionsListInitialState extends VersionsState {
  @override
  List<Object?> get props => [];
}

class VersionsListLoadedState extends VersionsState {
  final List<VersionFile> versionFile;

  const VersionsListLoadedState({required this.versionFile});

  @override
  List<Object?> get props => [versionFile];
}

class VersionsListErrorState extends VersionsState {
  final String error;
  const VersionsListErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
