import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user_model.dart';
import '../service/i_users_service.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final IUsersService userService;
  late List<UserModel> userList;
  UsersBloc(this.userService) : super(UsersInitial()) {
    on<FetchAllUsers>((event, emit) async {
      try {
        emit(UsersLoading());
        final users = await userService.fetchAllUsers();
        userList = users;
        emit(UsersLoaded(userList));
      } catch (e) {
        emit(UsersError(e.toString()));
      }
    });

    on<SearchUser>((event, emit) async {
      try {
        emit(UsersLoading());
        final users = await userService.fetchAllUsers();
        userList = users;
        emit(UsersLoaded(userList));
      } catch (e) {
        emit(UsersError(e.toString()));
      }
    });
  }
}
