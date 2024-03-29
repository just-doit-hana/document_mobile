import 'package:document_mobile/src/data/model/folder/folder_result_folder.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/folder/folder.dart';
import '../../../data/model/folder/folder_detail.dart';
import '../../../data/model/folder/folder_item.dart';
import '../../../data/model/restore/folder_restore.dart';
import '../../../data/repository/folder/folder_repo.dart';

part './folder_event.dart';
part './folder_state.dart';

class FolderBloc extends Bloc<FolderEvent, FolderState> {
  final FolderRepository _folderRepository;
  bool isFetching = false;

  FolderBloc(this._folderRepository) : super(FolderLoadingState()) {
    on<LoadFolderPublicEvent>(_loadFolderPublic);
    on<LoadFolderPrivateEvent>(_loadFolderPrivate);
    on<LoadFolderBackupEvent>(_folderbackup);
    on<ListShareFileEvent>(_listshareFile);
    on<LoadFolderItemEvent>(_loadFolderItem);
    on<FolderPrivateSearchEvent>(_searchFolderItem);
    on<DeleteRecycleBinFileEvent>(_deleteRecycleBin);
    on<RestoreBackupEvent>(_restoreBackup);
    on<LoadFolderRecycleBinEvent>(_loadFolderRecyleBin);
    on<RestoreRecycleBinFileEvent>(_restoreRecycleBinFile);
    on<DeleteRecycleBinFolderEvent>(_deleteRecycleBinFolder);
    on<RestoreRecycleBinFolderEvent>(_restoreRecycleBinFolder);
    on<ViewDetailFolderEvent>(_viewDetailFolder);
    on<ArchiveFolderEvent>(_folderArchive);
    on<FolderRenameEvent>(_folderRename);
    on<LockFolderEvent>(_lockFolder);
    on<MoveToFolderEvent>(_moveToFolder);
    on<CopyToFolderEvent>(_copyToFolder);
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
  void _moveToFolder(MoveToFolderEvent event, Emitter emit) async {
    emit(MoveToFolderLoadingState());
    try {
      final moveToFolder = await _folderRepository.moveToFolder(
          event.folderId, event.destinationFolderId);
      emit(MoveToFolderLoadedState(
          moveToFolder: moveToFolder!,
          folderId: event.folderId,
          destinationFolderId: event.destinationFolderId));
    } catch (e) {
      emit(MoveToFolderErrorState(error: e.toString()));
    }
  }

  void _copyToFolder(CopyToFolderEvent event, Emitter emit) async {
    emit(CopyFolderToLoadingState());
    try {
      final copyToFolder = await _folderRepository.copyToFolder(
          event.folderId, event.destinationFolderId);
      emit(CopyFolderToLoadedState(
          moveToFolder: copyToFolder!,
          folderId: event.folderId,
          destinationFolderId: event.destinationFolderId));
    } catch (e) {
      emit(CopyFolderToErrorState(error: e.toString()));
    }
  }

  void _searchFolderItem(FolderPrivateSearchEvent event, Emitter emit) async {
    emit(PrivateSearchLoading());
    try {
      final privateSearch =
          await _folderRepository.listPrivateFolderSearch(event.searchText);
      emit(PrivateSearchLoaded(privateFolderSearch: privateSearch!));
    } catch (e) {
      emit(PrivateSearchError(error: e.toString()));
    }
  }

  void _lockFolder(LockFolderEvent event, Emitter emit) async {
    emit(LockFolderLoadingState());
    try {
      final folderLock =
          await _folderRepository.lockFolder(event.folderId, event.isLock);
      emit(LockFolderLoadedState(
          detail: folderLock!, fileId: event.folderId, isLock: event.isLock));
    } catch (e) {
      emit(LockFolderErrorState(error: e.toString()));
    }
  }

  void _folderRename(FolderRenameEvent event, Emitter emit) async {
    emit(FolderRenameLoadingState());
    try {
      final folderRename =
          await _folderRepository.folderRename(event.folderId, event.name);
      emit(FolderRenameLoadedState(
          folderId: folderRename!.folderDeTail!.id!,
          name: folderRename.folderDeTail!.name!));
    } catch (e) {
      emit(FolderRenameErrorState(error: e.toString()));
    }
  }

  void _folderArchive(ArchiveFolderEvent event, Emitter emit) async {
    emit(ArchiveFolderLoadingState());
    try {
      final archiveFolder = await _folderRepository.archiveFolder(event.fileId);
      emit(ArchiveFolderLoadedState(fileId: archiveFolder!.folderDeTail!.id!));
    } catch (e) {
      emit(ArchiveFolderErrorState(error: e.toString()));
    }
  }

  void _viewDetailFolder(ViewDetailFolderEvent event, Emitter emit) async {
    emit(ViewDetailLoadingState());
    try {
      final viewDetail = await _folderRepository.folderDetailId(event.folderId);
      emit(ViewDetaiFolderlLoadedState(folderDetailResponse: viewDetail!));
    } catch (e) {
      emit(ViewDetailFolderErrorState(error: e.toString()));
    }
  }

  void _restoreRecycleBinFolder(
      RestoreRecycleBinFolderEvent event, Emitter<FolderState> emit) async {
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
  }

  void _restoreRecycleBinFile(
      RestoreRecycleBinFileEvent event, Emitter emit) async {
    emit(RestoreRecycleBinFileLoading());
    try {
      final idRestore = await _folderRepository.restoreRecycleFileBin(event.id);
      emit(RestoreRecycleBinFileLoaded(folderRestoreResponse: idRestore!));
    } catch (e) {
      emit(RestoreRecycleBinFileError(error: e.toString()));
    }
  }

  void _deleteRecycleBinFolder(
      DeleteRecycleBinFolderEvent event, Emitter emit) async {
    emit(DeleteRecycleBinFolderLoading());
    try {
      final idRestore =
          await _folderRepository.deteleRecycleBinFolder(event.id);
      emit(DeleteRecycleBinFolderLoaded(id: idRestore));
    } catch (e) {
      emit(DeleteRecycleFolderError(error: e.toString()));
    }
  }

  void _loadFolderRecyleBin(
      LoadFolderRecycleBinEvent event, Emitter emit) async {
    emit(FolderRecycleLoading());
    try {
      final recycleBin = await _folderRepository.listRecycleBin(page: 1);

      emit(FolderRecycleLoaded(
          recycleBin: recycleBin!, page: recycleBin.pagination!.currentPage));
    } catch (e) {
      emit(FolderRecyleError(e.toString()));
    }
  }

  void _deleteRecycleBin(DeleteRecycleBinFileEvent event, Emitter emit) async {
    emit(DeleteRecycleBinFileLoading());
    try {
      final idRestore = await _folderRepository.deleteRecycleBinFile(event.id);
      emit(DeleteRecycleBinFileLoaded(id: idRestore));
    } catch (e) {
      emit(DeleteRecycleFileError(error: e.toString()));
    }
  }

  void _restoreBackup(RestoreBackupEvent event, Emitter emit) async {
    emit(RestoreBackupLoading());
    try {
      final idBackup = await _folderRepository.restoreRecycleBackup(event.id);
      emit(RestoreBackupLoaded(folderRestoreBackupResponse: idBackup!));
    } catch (e) {
      emit(RestoreBackupError(error: e.toString()));
    }
  }

  void _loadFolderItem(LoadFolderItemEvent event, Emitter emit) async {
    emit(FolderItemLoading());
    try {
      final folderItem = await _folderRepository.listItemPublic(event.id!);
      emit(FolderItemLoaded(event.id!, folderItem));
    } catch (e) {
      emit(FolderItemErrorState(e.toString()));
    }
  }

  void _folderbackup(LoadFolderBackupEvent event, Emitter emit) async {
    emit(FolderBackupLoading());
    try {
      final fileBackup = await _folderRepository.backupFolder();
      emit(FolderBackupLoaded(fileBackup!));
    } catch (e) {
      emit(FolderBackupError(e.toString()));
    }
  }

  void _listshareFile(ListShareFileEvent event, Emitter emit) async {
    emit(ListShareLoadingState());
    try {
      final sharefile = await _folderRepository.listShareFile();
      emit(ListShareLoadedState(sharefile: sharefile!));
    } catch (e) {
      emit(ListShareErrorState(e.toString()));
    }
  }

  void _loadFolderPublic(LoadFolderPublicEvent event, Emitter emit) async {
    emit(FolderLoadingState());
    try {
      final folder = await _folderRepository.listPublicFolder();
      emit(FolderLoadedState(folder: folder));
    } catch (e) {
      emit(FolderErrorState(e.toString()));
    }
  }

  void _loadFolderPrivate(
      LoadFolderPrivateEvent event, Emitter<FolderState> emit) async {
    emit(FolderPrivateLoadingState());
    try {
      final privateFolder = await _folderRepository.listPrivateFolder();
      emit(FolderPrivateLoadedState(privateFolder: privateFolder!));
    } catch (e) {
      emit(FolderPrivateErrorState(e.toString()));
    }
  }
}
