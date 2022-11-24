// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quota_bloc.dart';

abstract class QoutaState extends Equatable {
  const QoutaState();
}

class QoutaInitialState extends QoutaState {
  @override
  List<Object?> get props => [];
}

class QoutaLoadedState extends QoutaState {
  final Quota quota;

  const QoutaLoadedState(this.quota);

  @override
  List<Object?> get props => [quota];
}

class QuotaErrorState extends QoutaState {
  final String error;
  const QuotaErrorState({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}
