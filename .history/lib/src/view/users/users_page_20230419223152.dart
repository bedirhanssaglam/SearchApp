import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/src/view/users/bloc/users_bloc.dart';
import 'models/user_model.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> with BaseState {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchService(networkManager)),
      child: Scaffold(
        body: BlocConsumer<SearchCubit, SearchState>(
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case SearchLoading:
                return Center(child: CircularProgressIndicator());
              case SearchComplete:
                return _createSearchListView(context, state as SearchComplete);
              default:
                return SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget _createSearchListView(
      BuildContext context, SearchComplete searchComplete) {
    final items = searchComplete.model?.data ?? [];
    return CustomScrollView(
      slivers: [_sliverAppBar(context), _sliverList(items)],
    );
  }

  SliverAppBar _sliverAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        title: SearchField(
          onChanged: (value) {
            context.read<UsersBloc>().add(SearchUser(value));
          },
        ),
      ),
    );
  }

  SliverList _sliverList(List<UserModel> users) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return SearchItemCard(item: users[index]);
    }, childCount: users.length));
  }
}
