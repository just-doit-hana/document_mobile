// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'folder_event.dart';
import 'folder_state.dart';

class FolderBloc extends Bloc<FolderEvent, FolderState> {
  FolderBloc(super.initialState);
  // final FolderRepository _folderRepository;
  // FolderBloc(this._folderRepository) : super(FolderLoadingState()) {
  //   on<FolderEvent>((event, emit) async {
  //     emit(FolderLoadingState());
  //     try {
  //       final _folderPublic = _folderRepository.listPublicFolder();
  //       emit(FolderLoadedState(_folderPublic));
  //     } catch (e) {}
  //   });
  // }
}
