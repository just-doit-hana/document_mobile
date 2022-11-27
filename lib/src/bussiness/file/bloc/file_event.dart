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
