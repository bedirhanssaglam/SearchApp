import 'package:search_app/src/core/constants/app/app_constants.dart';
import 'package:search_app/src/view/users/models/user_model.dart';

import '../../../core/constants/enums/network_enums.dart';
import 'i_users_service.dart';

class UsersService extends IUsersService {
  @override
  Future<UserModel?> fetchAllUsers() async {
    final uri =
        Uri.parse("${AppConstants.instance.baseUrl}${ServiceEnums.users.name}");
  }
}
