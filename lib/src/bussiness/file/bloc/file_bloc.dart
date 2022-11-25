// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:document_mobile/src/data/model/file/file_detail.dart';
import 'package:document_mobile/src/data/repository/file/file_repository.dart';
import 'package:equatable/equatable.dart';

part 'file_event.dart';
part 'file_state.dart';

class FileBloc extends Bloc<FileEvent, FileState> {
  final FileRepository _fileRepository;
  FileBloc(this._fileRepository) : super(ViewDetailLoadingState()) {
    on<ViewDetailFileEvent>(_fileDetails);
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
}
