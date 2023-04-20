import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:search_app/src/core/constants/app/app_constants.dart';
import 'package:search_app/src/view/users/models/image_model.dart';
import 'package:search_app/src/view/users/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/enums/network_enums.dart';
import 'i_users_service.dart';

class UsersService extends IUsersService {
  @override
  Future<List<UserModel>>? fetchAllUsers() async {
    final uri = Uri.parse(
      "${AppConstants.instance.baseUrl}${ServiceEnums.users.name}",
    );
    final response = await http.get(uri);
    if (response.statusCode == HttpStatus.ok) {
      var data = jsonDecode(response.body) as List<dynamic>;
      return data.map((e) => UserModel.fromJson(e)).toList();
    } else {
      return throw Exception();
    }
  }

  @override
  Future<ImageModel> fetchUsersImage({required String id}) async {
    final uri = Uri.parse(
      "${AppConstants.instance.baseUrlForImage}$id/${ServiceEnums.info.name}",
    );
    final response = await http.get(uri);
    if (response.statusCode == HttpStatus.ok) {
      var data = jsonDecode(response.body);
      return ImageModel.fromJson(data);
    } else {
      return throw Exception();
    }
  }
}
