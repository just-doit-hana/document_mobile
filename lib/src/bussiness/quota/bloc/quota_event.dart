part of 'quota_bloc.dart';

abstract class QuotaEvent extends Equatable {
  const QuotaEvent();
}

class GetQuataByAccountEvent extends QuotaEvent {
  final String accountId;
  const GetQuataByAccountEvent({required this.accountId});

  @override
  List<Object?> get props => [accountId];
}
