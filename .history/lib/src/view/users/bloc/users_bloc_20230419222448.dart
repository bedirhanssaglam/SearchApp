import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user_model.dart';
import '../service/i_users_service.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final IUsersService userService;
  late List<UserModel> users;
  UsersBloc(this.userService) : super(UsersInitial()) {
    on<FetchAllUsers>((event, emit) async {
      try {
        emit(UsersLoading());
        final users = await userService.fetchAllUsers();
        emit(UsersLoaded(users));
      } catch (e) {
        emit(UsersError(e.toString()));
      }
    });
  }
}
