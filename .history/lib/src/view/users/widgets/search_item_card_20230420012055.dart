import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:search_app/src/core/base/functions/base_functions.dart';
import 'package:search_app/src/core/base/singleton/base_singleton.dart';
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
        onTap: () {
          mainPopup(
            context,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        BaseFunctions.instance.closePopup(context);
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  10.ph,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      userImage!,
                      width: context.dynamicWidth(0.2),
                      height: context.dynamicHeight(0.1),
                      fit: BoxFit.cover,
                    ),
                  ),
                  20.ph,
                  Text(
                    widget.user.name ?? "",
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  5.ph,
                  Text(widget.user.website ?? ""),
                  20.ph,
                  Row(
                    children: [
                      const Text("Email: "),
                      Text(widget.user.email ?? ""),
                    ],
                  ),
                  5.ph,
                  Row(
                    children: [
                      const Text("Telefon: "),
                      Text(widget.user.phone ?? ""),
                    ],
                  ),
                  5.ph,
                  Row(
                    children: [
                      const Text("Adres: "),
                      Text(widget.user.address?.street ?? ""),
                    ],
                  ),
                  5.ph,
                  Row(
                    children: [
                      const Text("Şehir: "),
                      Text(widget.user.address?.city ?? ""),
                    ],
                  ),
                  5.ph,
                  Row(
                    children: [
                      const Text("Konum: "),
                      Text(
                          "${widget.user.address?.geo?.lat}/${widget.user.address?.geo?.lng}"),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
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
