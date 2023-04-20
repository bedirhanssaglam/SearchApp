import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/src/view/users/bloc/users_bloc.dart';
import 'package:search_app/src/view/users/service/users_service.dart';
import 'package:search_app/src/view/users/users_page.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => UsersBloc(UsersService()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SearchView(),
    );
  }
}
