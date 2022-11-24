// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitialEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final LoginUser? loginUser;
  const AuthLoginEvent({
    this.loginUser,
  });
}

class AuthLogoutEvent extends AuthEvent {}
