// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'file_bloc.dart';

abstract class FileEvent extends Equatable {
  const FileEvent();

  @override
  List<Object> get props => [];
}

class ViewDetailFileEvent extends FileEvent {
  final String fileId;

  const ViewDetailFileEvent({required this.fileId});
}

class BackupFileEvent extends FileEvent {
  final String fileId;

  const BackupFileEvent({required this.fileId});
}

class ArchiveFileEvent extends FileEvent {
  final String fileId;
  const ArchiveFileEvent({required this.fileId});
}

class RenameFileEvent extends FileEvent {
  final FileRename fileRename;
  final String fileId;
  const RenameFileEvent({required this.fileId, required this.fileRename});
}

class LockFileEvent extends FileEvent {
  final String fileId;
  final bool isLock;
  const LockFileEvent({required this.fileId, required this.isLock});
}

class DowloadFileEvent extends FileEvent {
  final String fileId;
  DowloadFileEvent({required this.fileId});
}
