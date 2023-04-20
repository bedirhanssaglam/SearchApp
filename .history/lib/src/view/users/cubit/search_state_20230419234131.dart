// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchLoading extends SearchState {}

class SearchComplete extends SearchState {
  final List<UserModel>? model;

  SearchComplete(
    this.model,
  );
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}

class UsersImageLoading extends SearchState {}

class UsersImageLoaded extends SearchState {
  final ImageModel image;

  UsersImageLoaded(this.image);
}

class UsersImageError extends SearchState {
  final String errorMessage;
}
