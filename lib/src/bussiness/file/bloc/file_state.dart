// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class ArchiveFileLoadingState extends FileState {}

class ArchiveFileLoadedState extends FileState {
  final String fileId;

  const ArchiveFileLoadedState({required this.fileId});
}

class ArchiveFileErrorState extends FileState {
  final String error;
  const ArchiveFileErrorState({required this.error});
}

class RenameFileLoadingState extends FileState {}

class RenameFileLoadedState extends FileState {
  final FileDetailResponse fileRename;
  final String? fileId;
  const RenameFileLoadedState({required this.fileRename, this.fileId});
}

class RenameFileErrorState extends FileState {
  final String error;
  const RenameFileErrorState({required this.error});
}

class LockFileLoadingState extends FileState {}

class LockFileLoadedState extends FileState {
  final FileDetailResponse detail;
  final String fileId;
  final bool isLock;
  const LockFileLoadedState({
    required this.isLock,
    required this.detail,
    required this.fileId,
  });
}

class LockFileErrorState extends FileState {
  final String error;
  const LockFileErrorState({required this.error});
}

class DownloadFileLoadingState extends FileState {}

class DowloadFileLoadedState extends FileState {}

class DowloadFileErrorState extends FileState {
  final String error;
  const DowloadFileErrorState({required this.error});
}

class MoveToFileLoadingState extends FileState {}

class MoveToFileLoadedState extends FileState {
  final FileMoveTo fileMoveTo;
  final String fileId;
  final String destinationFolderId;
  const MoveToFileLoadedState({
    required this.fileMoveTo,
    required this.fileId,
    required this.destinationFolderId,
  });
}

class MoveToFileError extends FileState {
  final String error;
  const MoveToFileError({required this.error});
}

class CopyFileLoadingState extends FileState {}

class CopyFileLoadedState extends FileState {
  final String fileId;
  final String destinationFolderId;
  final FileDetailResponse fileDetail;

  const CopyFileLoadedState(
      {required this.fileId,
      required this.fileDetail,
      required this.destinationFolderId});
}

class CopyFileErrorState extends FileState {
  final String error;
  const CopyFileErrorState({required this.error});
}
