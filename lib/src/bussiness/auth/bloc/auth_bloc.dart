import 'package:bloc/bloc.dart';
import 'package:document_appmobile/app/enum/data_status.dart';
import 'package:document_appmobile/src/data/model/login/login_user.dart';
import 'package:document_appmobile/src/data/repository/auth/login_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginRepository _loginRepository;
  AuthBloc({required LoginRepository loginRepository})
      : _loginRepository = loginRepository,
        super(const AuthState(null, DataStatus.initial, '')) {
    on<AuthLogin>((event, emit) async {
      final result = await _loginRepository.loginUser(event.loginUser);
      // if (state.status.isSubmitting) return;
      // if (result.success!) {

      // } else {

      // }
      print('result $result');
    });
  }
}
