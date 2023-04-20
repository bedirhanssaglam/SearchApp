import '../models/user_model.dart';

abstract class IUsersService {
  Future<UserModel?> fetchAllUsers();
}
