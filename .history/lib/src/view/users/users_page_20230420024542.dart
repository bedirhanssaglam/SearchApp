import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/src/core/components/appbar/custom_appbar.dart';
import 'package:search_app/src/core/base/singleton/base_singleton.dart';
import 'package:search_app/src/core/extensions/num_extension.dart';
import 'package:search_app/src/view/users/widgets/search_field.dart';
import 'package:search_app/src/view/users/widgets/user_card.dart';

import 'cubit/search_cubit.dart';
import 'models/user_model.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> with BaseSingleton {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case SearchLoading:
              return functions.platformIndicator();
            case SearchComplete:
              return _buildUsersList(context, state as SearchComplete);
            case SearchError:
              return functions.errorText(constants.serviceError);
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildUsersList(
    BuildContext context,
    SearchComplete searchComplete,
  ) {
    final List<UserModel> users = searchComplete.model ?? [];
    return SingleChildScrollView(
      child: Column(
        children: [
          10.ph,
          SearchField(
            controller: searchController,
            onChanged: (value) {
              context.read<SearchCubit>().findUsers(value);
            },
          ),
          10.ph,
          users.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return UserCard(
                      user: users[index],
                    );
                  },
                )
              : functions.errorText(constants.noFoundUser),
          10.ph,
        ],
      ),
    );
  }
}
