import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/src/view/users/bloc/users_bloc.dart';
import 'package:search_app/src/view/users/service/users_service.dart';
import 'models/user_model.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsersBloc>(
      create: (context) => UsersBloc(UsersService()),
      child: Scaffold(
        body: BlocConsumer<UsersBloc, UsersState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is UsersLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UsersLoaded) {
              return _createSearchListView(context, state);
            } else if (state is UsersError) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return const Center(
                child: Text("Something went wrong"),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _createSearchListView(
      BuildContext context, UsersLoaded searchComplete) {
    final items = searchComplete.users;
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
