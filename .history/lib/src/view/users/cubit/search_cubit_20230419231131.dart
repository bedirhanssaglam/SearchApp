import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/user_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
}
