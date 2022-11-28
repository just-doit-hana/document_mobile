// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'infiniscroll_bloc.dart';

abstract class InfiniscrollEvent extends Equatable {
  const InfiniscrollEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class RecycleBinFetched extends InfiniscrollEvent {
  int page;
  bool hasReachedMax;
  FolderItemResponse folderItemResponse;
  RecycleBinFetched({
    required this.page,
    required this.hasReachedMax,
    required this.folderItemResponse,
  });
  @override
  List<Object> get props => [page, hasReachedMax, folderItemResponse];
}
