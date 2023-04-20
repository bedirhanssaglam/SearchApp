part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  final List<UserModel> users;

  UsersLoaded(this.users);
}

class UsersError extends UsersState {
  final String errorMessage;

  UsersError(this.errorMessage);
}
