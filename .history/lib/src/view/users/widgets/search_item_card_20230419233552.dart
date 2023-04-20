import 'package:flutter/material.dart';
import 'package:search_app/src/core/base/singleton/base_singleton.dart';
import 'package:search_app/src/core/extensions/context_extensions.dart';
import 'package:search_app/src/view/users/models/user_model.dart';

class SearchItemCard extends StatelessWidget with BaseSingleton {
  const SearchItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final UserModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: colors.mainColor,
      child: ListTile(
        onTap: () {},
        title: Text(item.username ?? "",
            style: context.textTheme.bodyLarge?.copyWith(
              color: Colors.white,
            )),
        subtitle: Text(item.email ?? ''),
        trailing: CircleAvatar(
            radius: 10, child: FittedBox(child: Text('${item.id}'))),
        // leading: CircleAvatar(
        //   backgroundImage:Image.network(item.)
        // ),
      ),
    );
  }
}
