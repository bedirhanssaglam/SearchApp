import 'dart:convert';
import 'package:search_app/src/view/users/models/user_model.dart';

class MultiThreadUtility {
  static SearchModel? findUsersModelParents(SearchModel model) {
    final findValues = model.users
        .where((element) => element.isValueContains(model.key))
        .toList();
    model.users = findValues;
    return model;
  }
}

class SearchModel {
  final String key;
  List<UserModel> users;

  SearchModel(this.key, this.users);

  factory SearchModel.fromMap(Map<String, dynamic> map) => SearchModel(
      map['key'],
      List<UserModel>.from(map['users']?.map((x) => UserModel.fromJson(x))));

  factory SearchModel.fromJson(String source) =>
      SearchModel.fromMap(json.decode(source));
}
