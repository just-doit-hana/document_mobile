// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:document_mobile/src/data/model/file/file_detail.dart';
import 'package:document_mobile/src/data/model/file/file_rename.dart';
import 'package:document_mobile/src/data/repository/file/file_repository.dart';
import 'package:equatable/equatable.dart';

part 'file_event.dart';
part 'file_state.dart';

class FileBloc extends Bloc<FileEvent, FileState> {
  final FileRepository _fileRepository;
  FileBloc(this._fileRepository) : super(ViewDetailLoadingState()) {
    on<ViewDetailFileEvent>(_fileDetails);
    on<BackupFileEvent>(_backupFile);
    on<ArchiveFileEvent>(_archiveFile);
    on<RenameFileEvent>(_renameFile);
    on<LockFileEvent>(_lockFile);
    on<DowloadFileEvent>(_dowloadFile);
  }

  void _dowloadFile(DowloadFileEvent event, Emitter emit) async {
    emit(DownloadFileLoadingState());
    try {
      _fileRepository.downloadFile(event.fileId);
      emit(DowloadFileLoadedState());
    } catch (e) {
      emit(DowloadFileErrorState(error: e.toString()));
    }
  }

  void _renameFile(RenameFileEvent event, Emitter emit) async {
    emit(RenameFileLoadingState());
    try {
      final renameFile =
          await _fileRepository.renameFile(event.fileId, event.fileRename);
      emit(RenameFileLoadedState(fileRename: renameFile!));
    } catch (e) {
      emit(RenameFileErrorState(error: e.toString()));
    }
  }

  void _fileDetails(ViewDetailFileEvent event, Emitter emit) async {
    emit(ViewDetailLoadingState());
    try {
      final viewDetail = await _fileRepository.fileDetailId(event.fileId);
      emit(ViewDetaiFilelLoadedState(fileDetailResponse: viewDetail!));
    } catch (e) {
      emit(ViewDetailFileErrorState(error: e.toString()));
    }
  }

  void _backupFile(BackupFileEvent event, Emitter emit) async {
    emit(BackupFileLoadingState());
    try {
      final backupFile = await _fileRepository.backupFile(event.fileId);
      emit(BackupFilelLoadedState(fileId: backupFile!.fileId!));
    } catch (e) {
      emit(BackupFileErrorState(error: e.toString()));
    }
  }

  void _archiveFile(ArchiveFileEvent event, Emitter emit) async {
    emit(ArchiveFileLoadingState());
    try {
      final archiveFile = await _fileRepository.archiveFile(event.fileId);
      emit(ArchiveFileLoadedState(fileId: archiveFile!.fileId!));
    } catch (e) {
      emit(ArchiveFileErrorState(error: e.toString()));
    }
  }

  void _lockFile(LockFileEvent event, Emitter emit) async {
    emit(LockFileLoadingState());
    try {
      final lockFile =
          await _fileRepository.lockFile(event.fileId, event.isLock);
      emit(LockFileLoadedState(
          isLock: event.isLock, detail: lockFile!, fileId: event.fileId));
    } catch (e) {
      emit(LockFileErrorState(error: e.toString()));
    }
  }
}
