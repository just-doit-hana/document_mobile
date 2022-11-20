// ignore_for_file: unused_field

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../app/enum/data_status.dart';
import '../../../data/model/login/login_user.dart';
import '../../../data/repository/auth/login_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginRepository _loginRepository;
  AuthBloc({required LoginRepository loginRepository})
      : _loginRepository = loginRepository,
        super(const AuthState(null, DataStatus.initial, '')) {
    on<AuthLogin>((event, emit) async {
      // final result = await _loginRepository.loginUser(event.loginUser);
      // if (state.status.isSubmitting) return;
      // if (result.success!) {

      // } else {

      // }
      // print('result $result');
    });
  }
}
