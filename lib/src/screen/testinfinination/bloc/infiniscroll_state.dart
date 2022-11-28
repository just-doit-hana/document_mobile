part of 'infiniscroll_bloc.dart';

abstract class InfiniscrollState extends Equatable {}

class InfiniscrollInitial extends InfiniscrollState {
  InfiniscrollInitial();

  @override
  List<Object?> get props => [];
}

class InfinitiScrollSuccess extends InfiniscrollState {
  final FolderItemResponse recleBin;
  final int page;
  final bool hasReachedMax;

  InfinitiScrollSuccess(
      {required this.recleBin,
      required this.page,
      required this.hasReachedMax});
  @override
  List<Object> get props => [hasReachedMax, recleBin, page];
}

class InfinitiScrollFailure extends InfiniscrollState {
  final FolderItemResponse recleBin;
  final int page;
  final bool hasReachedMax;

  InfinitiScrollFailure(
      {required this.recleBin,
      required this.page,
      required this.hasReachedMax});
  @override
  List<Object> get props => [hasReachedMax, recleBin, page];
}
