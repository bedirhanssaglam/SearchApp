import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/src/core/base/singleton/base_singleton.dart';
import 'package:search_app/src/core/extensions/context_extensions.dart';
import 'package:search_app/src/view/users/models/user_model.dart';
import 'package:search_app/src/view/users/service/users_service.dart';

import '../cubit/search_cubit.dart';

class SearchItemCard extends StatefulWidget {
  const SearchItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final UserModel item;

  @override
  State<SearchItemCard> createState() => _SearchItemCardState();
}

class _SearchItemCardState extends State<SearchItemCard> with BaseSingleton {
  String? userImage;

  @override
  void initState() {
    super.initState();
    setUserImage();
  }

  setUserImage() async {
    var response =
        await UsersService().fetchUsersImage(id: widget.item.id.toString());
    userImage = response.downloadUrl;
    log(userImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: colors.mainColor,
      child: ListTile(
        onTap: () {},
        title: Text(widget.item.username ?? "",
            style: context.textTheme.bodyLarge?.copyWith(
              color: Colors.white,
            )),
        subtitle: Text(
          widget.item.email ?? '',
          style: context.textTheme.bodyLarge?.copyWith(
            color: Colors.white,
          ),
        ),
        trailing: CircleAvatar(
            radius: 10, child: FittedBox(child: Text('${widget.item.id}'))),
        leading: userImage != null
            ? CircleAvatar(
                radius: 10,
                child: Image.network(
                  userImage!,
                  width: 10,
                  height: 10,
                  fit: BoxFit.cover,
                ),
              )
            : functions.platformIndicator(),
      ),
    );
  }
}
