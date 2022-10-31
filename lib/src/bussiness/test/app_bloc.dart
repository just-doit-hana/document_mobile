import 'package:document_appmobile/src/bussiness/test/app_event.dart';
import 'package:document_appmobile/src/bussiness/test/app_states.dart';
import 'package:document_appmobile/src/data/repository/folder/folder_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FolderRepository _folderRepository;
  UserBloc(this._folderRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await _folderRepository.listPublicFolder();
        // print('User $users');
        emit(UserLoadedState(users!));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
