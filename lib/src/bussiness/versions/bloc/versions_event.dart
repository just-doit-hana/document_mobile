part of 'versions_bloc.dart';

abstract class VersionsEvent extends Equatable {
  const VersionsEvent();
}

class ListVersionEvent extends VersionsEvent {
  final String fileId;
  const ListVersionEvent({required this.fileId});

  @override
  List<Object?> get props => [fileId];
}
