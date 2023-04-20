part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class FetchAllUsers extends UsersEvent {}

class SearchUser extends UsersEvent {
  final String searchWord;

  SearchUser(this.searchWord);
}
