import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/src/view/users/models/user_model.dart';
import 'package:search_app/src/view/users/service/i_users_service.dart';

import '../../../core/utils/search_utils.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchService) : super(SearchLoading()) {
    _fetchItems();
  }
  late final IUsersService _searchService;

  late List<UserModel> _userModel;

  Future<void> _fetchItems() async {
    final response = await _searchService.fetchAllUsers();
    if (response != null) {
      _userModel = response;
      emit(SearchComplete(response));
    } else {
      emit(SearchError('Something went wrong!'));
    }
  }

  Future<void> findItems(String key) async {
    final response = await compute(
        MultiThreadUtility.findItemsModelParents, SearchModel(key, _userModel));
    if (response != null) {
      emit(SearchComplete(response.users));
    }
  }
}
