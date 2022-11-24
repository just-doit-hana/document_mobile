// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'versions_event.dart';
part 'versions_state.dart';

class VersionsBloc extends Bloc<VersionsEvent, VersionsState> {
  VersionsBloc() : super(VersionsInitial()) {
    on<VersionsEvent>((event, emit) {});
  }
}
