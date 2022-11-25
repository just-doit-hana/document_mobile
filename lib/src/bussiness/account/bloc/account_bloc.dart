// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:document_mobile/src/data/model/userscreen/userseen.dart';
import 'package:document_mobile/src/data/repository/account/account_repository.dart';
import 'package:equatable/equatable.dart';

import 'package:document_mobile/src/data/model/account/account.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountRepository _accountRepository;
  AccountBloc(this._accountRepository) : super(AccountListInitialState()) {
    on<ListAccountEvent>(_account);
    on<ListUserseenEvent>(_listUserSeen);
  }
  void _account(ListAccountEvent event, Emitter emit) async {
    emit(AccountListInitialState());
    try {
      final accountList = await _accountRepository.getListAccount();
      emit(AccountListLoadedState(accountResponse: accountList!.account));
    } catch (e) {
      emit(AccountListErrorState(error: e.toString()));
    }
  }

  void _listUserSeen(ListUserseenEvent event, Emitter emit) async {
    emit(UserSeenListInitialState());
    try {
      final userSeen =
          await _accountRepository.getListUserSeen(fileId: event.fileId);
      emit(UserSeenListLoadedState(accountResponse: userSeen!.userseen));
    } catch (e) {
      emit(UserSeenListErrorState(error: e.toString()));
    }
  }
}
