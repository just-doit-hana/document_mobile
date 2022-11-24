part of 'versions_bloc.dart';

abstract class VersionsState extends Equatable {
  const VersionsState();
  
  @override
  List<Object> get props => [];
}

class VersionsInitial extends VersionsState {}
