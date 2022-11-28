// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:document_mobile/src/data/model/folder/folder_item.dart';
import 'package:document_mobile/src/data/repository/folder/folder_repo.dart';
import 'package:equatable/equatable.dart';

part 'infiniscroll_event.dart';
part 'infiniscroll_state.dart';

class InfiniscrollBloc extends Bloc<InfiniscrollEvent, InfiniscrollState> {
  final FolderRepository _folderRepository;

  InfiniscrollBloc(this._folderRepository) : super(InfiniscrollInitial()) {
    on<RecycleBinFetched>(_recycleBin);
  }
  void _recycleBin(RecycleBinFetched event, Emitter emitter) async {
    try {
      if (state is InfiniscrollInitial) {
        final recycleBin = await _folderRepository.listRecycleBinTest(page: 1);
        emitter(InfinitiScrollSuccess(
            hasReachedMax: false, page: 1, recleBin: recycleBin));
      }
      int newPage = event.page + 1;
      final recycleBin =
          await _folderRepository.listRecycleBinTest(page: newPage);
      emitter(InfinitiScrollSuccess(
          hasReachedMax: false, page: newPage, recleBin: recycleBin));
    } on Exception {
      emitter(InfinitiScrollFailure(
        hasReachedMax: event.hasReachedMax,
        recleBin: event.folderItemResponse,
        page: event.page,
      ));
    }
  }
}
