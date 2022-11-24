// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'file_bloc.dart';

abstract class FileEvent extends Equatable {
  const FileEvent();

  @override
  List<Object> get props => [];
}

class ViewDetailFileEvent extends Equatable {
  final String fileId;

  const ViewDetailFileEvent(this.fileId);
  @override
  List<Object?> get props => [];
}

class ViewDetailFolderEvent extends Equatable {
  final String folderId;
  const ViewDetailFolderEvent({
    required this.folderId,
  });
  @override
  List<Object?> get props => [];
}
