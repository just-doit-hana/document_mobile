// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/model/login/login_user.dart';
import '../../../data/repository/auth/login_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginRepository _loginRepository;
  AuthBloc({required LoginRepository loginRepository})
      : _loginRepository = loginRepository,
        super(AuthInitialState()) {
    on<AuthLoginEvent>(_login);
  }
  void _login(AuthLoginEvent event, Emitter emit) async {
    try {
      emit(AuthInitialState());
      final result = await _loginRepository.loginUser(event.loginUser!);
      emit(AuthLoginState(result!));
    } catch (e) {
      emit(AuthErrorState(error: e.toString()));
    }
  }
}
