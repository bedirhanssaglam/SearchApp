import 'dart:convert';
import 'dart:developer';

import 'package:search_app/src/core/constants/app/app_constants.dart';
import 'package:search_app/src/view/users/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/enums/network_enums.dart';
import 'i_users_service.dart';

class UsersService extends IUsersService {
  @override
  Future<List<UserModel>>? fetchAllUsers() async {
    final uri =
        Uri.parse("${AppConstants.instance.baseUrl}${ServiceEnums.users.name}");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      log(data.toString());
      return data.map((e) => UserModel.fromJson(e)).toList();
    } else {
      return throw Exception();
    }
  }
}
