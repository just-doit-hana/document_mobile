// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthenticationInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthenticationLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthenticationNotAuthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthenticationAuthenticated extends AuthState {
  final UserLoginReponse userInfor;

  const AuthenticationAuthenticated(this.userInfor);

  @override
  List<Object?> get props => [];
}

class AuthErrorState extends AuthState {
  final String error;
  const AuthErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}
