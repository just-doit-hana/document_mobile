// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();
}

class AccountListInitialState extends AccountState {
  @override
  List<Object?> get props => [];
}

class AccountListLoadedState extends AccountState {
  List<Account> accountResponse;
  AccountListLoadedState({
    required this.accountResponse,
  });
  @override
  List<Object> get props => [accountResponse];
}

class AccountListErrorState extends AccountState {
  final String error;
  const AccountListErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}

class UserSeenListInitialState extends AccountState {
  @override
  List<Object?> get props => [];
}

class UserSeenListLoadedState extends AccountState {
  List<UserSeen> accountResponse;
  UserSeenListLoadedState({
    required this.accountResponse,
  });
  @override
  List<Object> get props => [accountResponse];
}

class UserSeenListErrorState extends AccountState {
  final String error;
  const UserSeenListErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}
