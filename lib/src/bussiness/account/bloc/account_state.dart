// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();
}

class AccountInitialState extends AccountState {
  @override
  List<Object?> get props => [];
}

class AccountLoadedState extends AccountState {
  List<Account> accountResponse;
  AccountLoadedState({
    required this.accountResponse,
  });
  @override
  List<Object> get props => [accountResponse];
}

class AccountErrorState extends AccountState {
  final String error;
  const AccountErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}
