// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:document_mobile/src/data/model/account/account.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitialState()) {
    on<AccountEvent>(_account);
  }
  void _account(AccountEvent event, Emitter emitter) {}
}
