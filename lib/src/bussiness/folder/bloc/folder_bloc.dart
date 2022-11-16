import 'package:document_appmobile/src/data/model/folder/folder_item.dart';
import 'package:document_appmobile/src/data/model/folder/folder_test_no.dart';
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
        emit(FolderLoadedState(folder: folder));
      } catch (e) {
        emit(FolderErrorState(e.toString()));
      }
    });

    on<LoadFolderPrivateEvent>((event, emit) async {
      emit(FolderPrivateLoadingState());
      try {
        final privateFolder = await _folderRepository.listPrivateFolder();
        emit(FolderPrivateLoadedState(privateFolder: privateFolder));
      } catch (e) {
        emit(FolderPrivateErrorState(e.toString()));
      }
    });

    on<LoadFolderItemEvent>((event, emit) async {
      emit(FolderItemLoading());
      try {
        final folderItem = await _folderRepository.listItemPublic(event.id!);
        emit(FolderItemLoaded(event.id!, folderItem));
      } catch (e) {
        emit(FolderItemErrorState(e.toString()));
      }
    });

    on<LoadFolderRecycleBinEvent>((event, emit) async {
      emit(FolderRecycleLoading());
      try {
        final recycleBin = await _folderRepository.listRecycleBin();
        emit(FolderRecycleLoaded(recycleBin!));
      } catch (e) {
        emit(FolderRecyleError(e.toString()));
      }
    });

    on<DomainEvent>((event, emit) async {
      emit(DomainLoading());
      try {
        final domain = await _folderRepository.getTest();
        emit(DomainLoaded(domain));
      } catch (e) {
        emit(DomainErrorState(e.toString()));
      }
    });
  }
}
