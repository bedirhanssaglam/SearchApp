import 'dart:convert';
import 'dart:developer';

import 'package:search_app/src/core/constants/app/app_constants.dart';
import 'package:search_app/src/view/users/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/enums/network_enums.dart';
import 'i_users_service.dart';

class UsersService extends IUsersService {
  @override
  Future<UserModel?> fetchAllUsers() async {
    final uri =
        Uri.parse("${AppConstants.instance.baseUrl}${ServiceEnums.users.name}");
    final response = await http.post(uri);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      log(data.toString());
      return UserModel.fromJson(data);
    } else {
      return throw Exception();
    }
  }
}
