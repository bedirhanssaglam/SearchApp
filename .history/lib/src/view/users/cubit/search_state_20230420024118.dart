part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchLoading extends SearchState {}

class SearchComplete extends SearchState {
  final List<UserModel>? model;

  SearchComplete(this.model);
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}
