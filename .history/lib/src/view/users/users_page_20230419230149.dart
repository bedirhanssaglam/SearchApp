import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/src/core/base/singleton/base_singleton.dart';
import 'package:search_app/src/view/users/models/user_model.dart';
import 'package:search_app/src/view/users/service/users_service.dart';
import 'package:search_app/src/view/users/widgets/search_field.dart';
import 'package:search_app/src/view/users/widgets/search_item_card.dart';

import 'cubit/search_cubit.dart';
import 'cubit/search_state.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> with BaseSingleton {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(UsersService()),
      child: Scaffold(
        body: BlocConsumer<SearchCubit, SearchState>(
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case SearchLoading:
                return functions.platformIndicator();
              case SearchComplete:
                return _createSearchListView(context, state as SearchComplete);
              case SearchError:
                return functions.errorText("Something went wrong!");
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  Widget _createSearchListView(
      BuildContext context, SearchComplete searchComplete) {
    final items = searchComplete.model ?? [];
    return CustomScrollView(
      slivers: [
        _sliverAppBar(context),
        _sliverList(items),
      ],
    );
  }

  AppBar _sliverAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        title: SearchField(
          onChanged: (value) {
            context.read<SearchCubit>().findItems(value);
          },
        ),
      ),
    );
  }

  SliverList _sliverList(List<UserModel> items) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return SearchItemCard(item: items[index]);
    }, childCount: items.length));
  }
}
