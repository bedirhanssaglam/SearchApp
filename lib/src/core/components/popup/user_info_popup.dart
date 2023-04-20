import 'package:flutter/material.dart';
import 'package:search_app/src/core/extensions/context_extensions.dart';
import 'package:search_app/src/core/extensions/num_extension.dart';
import 'package:search_app/src/view/users/models/user_model.dart';

import '../../base/functions/base_functions.dart';
import 'main_popup.dart';

userInfoPopup(
  BuildContext context, {
  required UserModel user,
  required String userImage,
}) {
  return mainPopup(
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
              userImage,
              width: context.dynamicWidth(0.2),
              height: context.dynamicHeight(0.1),
              fit: BoxFit.cover,
            ),
          ),
          20.ph,
          Text(
            user.name ?? "",
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          5.ph,
          Text(user.website ?? ""),
          20.ph,
          Row(
            children: [
              const Text("Email: "),
              Text(user.email ?? ""),
            ],
          ),
          5.ph,
          Row(
            children: [
              const Text("Telefon: "),
              Text(user.phone ?? ""),
            ],
          ),
          5.ph,
          Row(
            children: [
              const Text("Adres: "),
              Text(
                "${user.address?.street}, ${user.address?.suite}",
              )
            ],
          ),
          5.ph,
          Row(
            children: [
              const Text("Şehir: "),
              Text(user.address?.city ?? ""),
            ],
          ),
          5.ph,
          Row(
            children: [
              const Text("Konum: "),
              Text("${user.address?.geo?.lat}/${user.address?.geo?.lng}"),
            ],
          ),
        ],
      ),
    ),
  );
}
