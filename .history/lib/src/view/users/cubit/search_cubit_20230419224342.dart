// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:search_app/src/view/users/models/user_model.dart';
// import 'package:search_app/src/view/users/service/i_users_service.dart';

// import '../../../core/utils/search_utils.dart';

// class SearchCubit extends Cubit<SearchState> {
//   SearchCubit(this.) : super(SearchLoading()) {
//     _searchService = service;
//     _fetchItems();
//   }
//   late final IUsersService _searchService;

//   late UserModel _userModel;

//   Future<void> _fetchItems() async {
//     final response = await _searchService.fetchAllItem();
//     if (response != null) {
//       _userModel = response;
//       emit(SearchComplete(response));
//     } else {
//       emit(SearchError('something went wrong'));
//     }
//   }

//   Future<void> findItems(String key) async {
//     final response = await compute(MultiThreadUtility.findItemsModelParents,
//         SearchModel(key, _userModel ?? []));
//     if (response != null) {
//       emit(SearchComplete(UserModel(data: response.items)));
//     }
//   }
// }

// abstract class SearchState {}

// class SearchLoading extends SearchState {}

// class SearchComplete extends SearchState {
//   final List<UserModel>? model;

//   SearchComplete(this.model);
// }

// class SearchError extends SearchState {
//   final String message;

//   SearchError(this.message);
// }
