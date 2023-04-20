import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:search_app/src/core/base/functions/base_functions.dart';
import 'package:search_app/src/core/base/singleton/base_singleton.dart';
import 'package:search_app/src/core/components/popup/user_info_popup.dart';
import 'package:search_app/src/core/extensions/context_extensions.dart';
import 'package:search_app/src/core/extensions/num_extension.dart';
import 'package:search_app/src/view/users/models/user_model.dart';
import 'package:search_app/src/view/users/service/users_service.dart';

import '../../../core/components/popup/main_popup.dart';

class SearchItemCard extends StatefulWidget {
  const SearchItemCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

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
        await UsersService().fetchUsersImage(id: widget.user.id.toString());
    setState(() {
      userImage = response.downloadUrl;
    });
    log("User Image : $userImage");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: colors.mainColor,
      child: ListTile(
        onTap: () => userInfoPopup(
          context,
          user: widget.user,
          userImage: userImage!,
        ),
        title: Text(widget.user.name ?? "",
            style: context.textTheme.bodyLarge?.copyWith(
              color: Colors.white,
            )),
        subtitle: Text(
          widget.user.username ?? '',
          style: context.textTheme.bodyLarge?.copyWith(
            color: Colors.white,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        leading: userImage != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  userImage!,
                  width: context.dynamicWidth(0.1),
                  height: context.dynamicHeight(0.05),
                  fit: BoxFit.cover,
                ),
              )
            : Container(
                height: context.dynamicHeight(0.015),
                width: context.dynamicWidth(0.03),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.mainColor,
                ),
              ),
      ),
    );
  }
}
