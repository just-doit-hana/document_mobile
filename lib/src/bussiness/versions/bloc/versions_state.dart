part of 'versions_bloc.dart';

abstract class VersionsState extends Equatable {
  const VersionsState();
}

class VersionsListInitialState extends VersionsState {
  @override
  List<Object?> get props => [];
}

class VersionsListLoadedState extends VersionsState {
  final List<VersionFile> userSeen;

  const VersionsListLoadedState({required this.userSeen});

  @override
  List<Object?> get props => [userSeen];
}

class VersionsListErrorState extends VersionsState {
  final String error;
  const VersionsListErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
