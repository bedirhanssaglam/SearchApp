import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/src/core/base/components/appbar/custom_appbar.dart';
import 'package:search_app/src/core/base/singleton/base_singleton.dart';
import 'package:search_app/src/core/constants/enums/icon_enums.dart';
import 'package:search_app/src/core/extensions/context_extensions.dart';
import 'package:search_app/src/core/extensions/num_extension.dart';
import 'package:search_app/src/core/extensions/string_extensions.dart';
import 'package:search_app/src/view/users/widgets/search_field.dart';
import 'package:search_app/src/view/users/widgets/search_item_card.dart';

import 'cubit/search_cubit.dart';

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

  Widget _buildUsersList(BuildContext context, SearchComplete searchComplete) {
    final items = searchComplete.model ?? [];
    return SingleChildScrollView(
      child: Column(
        children: [
          10.ph,
          SearchField(
            controller: searchController,
            onChanged: (value) {
              context.read<SearchCubit>().findItems(value);
            },
          ),
          10.ph,
          items.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return SearchItemCard(
                      item: items[index],
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
