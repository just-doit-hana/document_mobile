import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'folder_event.dart';
part 'folder_state.dart';

class FolderBloc extends Bloc<FolderEvent, FolderState> {
  FolderBloc() : super(FolderInitial()) {
    on<FolderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
