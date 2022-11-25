part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class ListAccountEvent extends AccountEvent {}

class ListUserseenEvent extends AccountEvent {
  final String fileId;
  const ListUserseenEvent({required this.fileId});
}
