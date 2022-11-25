// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:document_mobile/src/data/model/versionsfile/version_file.dart';
import 'package:document_mobile/src/data/repository/version/vesion_repo.dart';
import 'package:equatable/equatable.dart';

part 'versions_event.dart';
part 'versions_state.dart';

class VersionsBloc extends Bloc<VersionsEvent, VersionsState> {
  final VersionRepository _versionRepository;
  VersionsBloc(this._versionRepository) : super(VersionsListInitialState()) {
    on<ListVersionEvent>(_listVersion);
  }
  void _listVersion(ListVersionEvent event, Emitter emit) async {
    emit(VersionsListInitialState());
    try {
      final versionList =
          await _versionRepository.listVersionFile(fileId: event.fileId);
      emit(VersionsListLoadedState(userSeen: versionList.version));
    } catch (e) {
      emit(VersionsListErrorState(error: e.toString()));
    }
  }
}
