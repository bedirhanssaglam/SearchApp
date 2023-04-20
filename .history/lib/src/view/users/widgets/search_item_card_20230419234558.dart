import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/src/core/base/singleton/base_singleton.dart';
import 'package:search_app/src/core/extensions/context_extensions.dart';
import 'package:search_app/src/view/users/models/user_model.dart';

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
  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().fetchUsersImage(id: widget.item.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is UsersImageLoading) {
          return functions.platformIndicator();
        } else if (state is UsersImageLoaded) {
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
                  radius: 10,
                  child: FittedBox(child: Text('${widget.item.id}'))),
              leading: CircleAvatar(
                radius: 20,
                child: Image.network(state.image.downloadUrl!),
              ),
            ),
          );
        } else if (state is UsersImageError) {
          return functions.errorText(state.message);
        } else {
          return functions.errorText("Something went wrong!");
        }
      },
    );
  }
}
