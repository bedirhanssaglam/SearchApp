import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:search_app/src/core/constants/app/app_constants.dart';

import '../../../core/utils/search_utils.dart';
import '../models/user_model.dart';
import '../service/i_users_service.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final IUsersService _searchService;
  SearchCubit(this._searchService) : super(SearchLoading()) {
    _fetchItems();
  }
  late List<UserModel> _userModel;

  Future<void> _fetchItems() async {
    final response = await _searchService.fetchAllUsers();
    if (response != null) {
      _userModel = response;
      emit(SearchComplete(response));
    } else {
      emit(SearchError(AppConstants.instance.serviceError));
    }
  }

  Future<void> findItems(String key) async {
    final response = await compute(
      MultiThreadUtility.findItemsModelParents,
      SearchModel(key, _userModel),
    );
    if (response != null) {
      emit(SearchComplete(response.users));
    } else {
      emit(SearchError(AppConstants.instance.serviceError));
    }
  }
}
