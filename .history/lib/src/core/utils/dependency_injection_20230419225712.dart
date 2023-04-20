import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/src/view/users/cubit/search_cubit.dart';
import 'package:search_app/src/view/users/service/i_users_service.dart';
import 'package:search_app/src/view/users/service/users_service.dart';

class DependencyInjector {
  static DependencyInjector? _instance;

  static DependencyInjector get instance {
    _instance ??= DependencyInjector._init();
    return _instance!;
  }

  late final IUsersService usersService;
  late final SearchCubit searchCubit;

  DependencyInjector._init() {
    usersService = UsersService();
    searchCubit = SearchCubit(usersService);
  }

  List<RepositoryProvider> get repositoryProviders => [
        RepositoryProvider<IUsersService>(create: (context) => usersService),
      ];

  List<BlocProvider<Cubit>> get globalBlocProviders => [
        BlocProvider<SearchCubit>(create: (context) => searchCubit),
      ];
}
