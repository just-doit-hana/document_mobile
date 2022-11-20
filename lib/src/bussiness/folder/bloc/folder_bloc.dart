import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/folder/folder.dart';
import '../../../data/model/folder/folder_item.dart';
import '../../../data/model/restore/folder_restore.dart';
import '../../../data/repository/folder/folder_repo.dart';

part './folder_event.dart';
part './folder_state.dart';

class FolderBloc extends Bloc<FolderEvent, FolderState> {
  final FolderRepository _folderRepository;
  bool isFetching = false;

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
        emit(FolderPrivateLoadedState(privateFolder: privateFolder!));
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
        const int newPage = 0;

        final recycleBin =
            await _folderRepository.listRecycleBin(page: newPage + 1);
        if (recycleBin!.statusCode == 200) {
          emit(FolderRecycleLoaded(
              recycleBin: recycleBin, page: newPage, isLastPage: true));
        } else {
          emit(FolderRecyleError('Error'));
        }
      } catch (e) {
        emit(FolderRecyleError(e.toString()));
      }
    });

    on<RestoreRecycleBinFolderEvent>((event, emit) async {
      emit(RestoreRecycleBinFolderLoading());
      try {
        final idRestore =
            await _folderRepository.restoreRecycleFolderBin(event.id);
        emit(RestoreRecycleBinFolderLoaded(
          folderRestoreResponse: idRestore!,
        ));
      } catch (e) {
        emit(RestoreRecycleBinFolderError(error: e.toString()));
      }
    });

    on<RestoreRecycleBinFileEvent>((event, emit) async {
      emit(RestoreRecycleBinFileLoading());
      try {
        final idRestore =
            await _folderRepository.restoreRecycleFileBin(event.id);
        emit(RestoreRecycleBinFileLoaded(folderRestoreResponse: idRestore!));
      } catch (e) {
        emit(RestoreRecycleBinFileError(error: e.toString()));
      }
    });

    on<DeleteRecycleBinFolderEvent>((event, emit) async {
      emit(DeleteRecycleBinFolderLoading());
      try {
        final idRestore =
            await _folderRepository.deteleRecycleBinFolder(event.id);
        emit(DeleteRecycleBinFolderLoaded(id: idRestore));
      } catch (e) {
        emit(DeleteRecycleFolderError(error: e.toString()));
      }
    });

    on<DeleteRecycleBinFileEvent>((event, emit) async {
      emit(DeleteRecycleBinFileLoading());
      try {
        final idRestore =
            await _folderRepository.deleteRecycleBinFile(event.id);
        emit(DeleteRecycleBinFileLoaded(id: idRestore));
      } catch (e) {
        emit(DeleteRecycleFileError(error: e.toString()));
      }
    });

    on<RestoreBackupEvent>(((event, emit) async {
      emit(RestoreBackupLoading());
      try {
        final idBackup = await _folderRepository.restoreRecycleBackup(event.id);
        emit(RestoreBackupLoaded(folderRestoreBackupResponse: idBackup!));
      } catch (e) {
        emit(RestoreBackupError(error: e.toString()));
      }
    }));

    on<LoadFolderBackupEvent>((event, emit) async {
      emit(FolderBackupLoading());
      try {
        final fileBackup = await _folderRepository.backupFolder();
        emit(FolderBackupLoaded(fileBackup!));
      } catch (e) {
        emit(FolderBackupError(e.toString()));
      }
    });

    // on<DomainEvent>((event, emit) async {
    //   emit(DomainLoading());
    //   try {
    //     final domain = await _folderRepository.getTest();
    //     emit(DomainLoaded(domain));
    //   } catch (e) {
    //     emit(DomainErrorState(e.toString()));
    //   }
    // });
  }
}
