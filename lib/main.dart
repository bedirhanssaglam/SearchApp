import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/src/core/base/singleton/base_singleton.dart';
import 'package:search_app/src/view/users/cubit/search_cubit.dart';
import 'package:search_app/src/view/users/service/users_service.dart';
import 'package:search_app/src/view/users/users_page.dart';

void main() {
  runApp(
    RepositoryProvider(
      create: (context) => UsersService(),
      child: BlocProvider<SearchCubit>(
        create: (context) => SearchCubit(UsersService()),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget with BaseSingleton {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: constants.appName,
      home: const UsersPage(),
    );
  }
}
