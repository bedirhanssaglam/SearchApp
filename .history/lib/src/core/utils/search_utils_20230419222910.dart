import 'dart:convert';
import 'package:search_app/src/view/users/models/user_model.dart';

class MultiThreadUtility {
  static SearchModel? findItemsModelParents(SearchModel model) {
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

  Map<String, dynamic> toMap() =>
      {'key': key, 'items': users.map((x) => x.toJson()).toList()};

  factory SearchModel.fromMap(Map<String, dynamic> map) => SearchModel(
      map['key'],
      List<UserModel>.from(map['users']?.map((x) => UserModel.fromJson(x))));

  String toJson() => json.encode(toMap());

  factory SearchModel.fromJson(String source) =>
      SearchModel.fromMap(json.decode(source));
}
