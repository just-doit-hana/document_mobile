import 'package:document_appmobile/src/data/model/folder/folder_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/folder/folder.dart';
import '../../../data/repository/folder/folder_repo.dart';

part './folder_event.dart';
part './folder_state.dart';

class FolderBloc extends Bloc<FolderEvent, FolderState> {
  final FolderRepository _folderRepository;
  FolderBloc(this._folderRepository) : super(FolderLoadingState()) {
    on<LoadFolderPublicEvent>((event, emit) async {
      emit(FolderLoadingState());
      try {
        final folder = await _folderRepository.listPublicFolder();
        emit(FolderLoadedState(folder));
      } catch (e) {
        emit(FolderErrorState(e.toString()));
      }
    });

    on<LoadFolderPrivateEvent>((event, emit) {
      // emit()
    });

    on<LoadFolderItemEvent>((event, emit) async {
      emit(FolderItemLoading());
      try {
        final resultItemFolder = _folderRepository.listItemPublic(event.id!);
        emit(FolderItemLoaded(
            id: event.id!, resultItemFolder: resultItemFolder as dynamic));
      } catch (e) {
        emit(FolderItemErrorState(e.toString()));
      }
    });
  }
}
