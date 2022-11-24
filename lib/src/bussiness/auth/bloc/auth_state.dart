// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

// class AuthState extends Equatable {
//   const AuthState(this.userInfor, this.status, this.message);
//   final DataStatus status;
//   final String message;
//   final LoginUser? userInfor;
//   bool get hasUserInfor => userInfor != null;
//   bool get isProcessing =>
//       status.isDeleting || status.isUpdating || status.isSubmitting;
//   @override
//   List<Object> get props => [
//         status,
//         hasUserInfor,
//         isProcessing,
//       ];
// }
abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoginState extends AuthState {
  final LoginUser login;

  const AuthLoginState(this.login);

  @override
  List<Object?> get props => [login];
}

class AuthErrorState extends AuthState {
  final String error;
  const AuthErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}
