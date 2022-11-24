// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoginState extends AuthState {
  final UserLoginReponse userInfor;

  const AuthLoginState(this.userInfor);

  @override
  List<Object?> get props => [];
}

class AuthUnauthoriedState extends AuthState {
  const AuthUnauthoriedState();

  @override
  List<Object?> get props => [];
}

class AuthErrorState extends AuthState {
  final String error;
  const AuthErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}
