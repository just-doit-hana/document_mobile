// import 'package:bloc/bloc.dart';
// import 'package:document_appmobile/src/data/repository/folder/folder_repo.dart';

// import 'folder_event.dart';
// import 'folder_state.dart';

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
  }
}
