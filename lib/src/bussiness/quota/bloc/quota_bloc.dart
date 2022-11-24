// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:document_mobile/src/data/repository/quota/quota_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/quota/quota.dart';

part 'quota_event.dart';
part 'quota_state.dart';

class QuotaBloc extends Bloc<QuotaEvent, QoutaState> {
  final QuotaRepository _quotaRepository;
  QuotaBloc(this._quotaRepository) : super((QoutaInitialState())) {
    on<GetQuataByAccountEvent>(_getQuotaAccount);
  }
  void _getQuotaAccount(GetQuataByAccountEvent event, Emitter emit) async {
    emit(QoutaInitialState());
    try {
      final quota = await _quotaRepository.getQuotaByAccount(event.accountId);
      emit(QoutaLoadedState(quota!));
    } catch (e) {
      emit(QuotaErrorState(error: e.toString()));
    }
  }
}
