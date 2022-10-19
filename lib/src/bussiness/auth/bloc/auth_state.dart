// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState(this.userInfor, this.status, this.message);
  final DataStatus status;
  final String message;
  final LoginUser? userInfor;
  bool get hasUserInfor => userInfor != null;
  bool get isProcessing =>
      status.isDeleting || status.isUpdating || status.isSubmitting;
  @override
  List<Object> get props => [
        status,
        hasUserInfor,
        isProcessing,
      ];
}
