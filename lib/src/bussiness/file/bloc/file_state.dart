part of 'file_bloc.dart';

abstract class FileState extends Equatable {
  const FileState();

  @override
  List<Object> get props => [];
}

class FileInitial extends FileState {}

class ViewDetailLoadingState extends FileState {}

class ViewDetaiFilelLoadedState extends FileState {
  final FileDetailResponse fileDetailResponse;
  const ViewDetaiFilelLoadedState({required this.fileDetailResponse});
}

class ViewDetailFileErrorState extends FileState {
  final String error;
  const ViewDetailFileErrorState({required this.error});
}

class BackupFileLoadingState extends FileState {}

class BackupFilelLoadedState extends FileState {
  final String fileId;
  const BackupFilelLoadedState({required this.fileId});
}

class BackupFileErrorState extends FileState {
  final String error;
  const BackupFileErrorState({required this.error});
}
