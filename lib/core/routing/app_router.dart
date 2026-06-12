import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../feature/auth/data/repositories/auth_repository.dart';
import '../../feature/auth/presentation/manager/cubit/login_cubit/login_cubit.dart';
import '../../feature/auth/presentation/manager/cubit/register_cubit/register_cubit.dart';
import '../../feature/auth/presentation/views/login_page.dart';
import '../../feature/auth/presentation/views/register_page.dart';
import '../../feature/home/presentation/manager/cubit/home_cubit.dart';
import '../../feature/home/presentation/views/home_page.dart';
import 'route_name.dart';

abstract final class AppRouter {
  AppRouter._();

  static final _authRepository = AuthRepository();

  static final router = GoRouter(
    initialLocation: RouteName.login,
    routes: [
      GoRoute(
        path: RouteName.login,
        builder: (context, state) => BlocProvider(
          create: (_) => LoginCubit(_authRepository),
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: RouteName.register,
        builder: (context, state) => BlocProvider(
          create: (_) => RegisterCubit(_authRepository),
          child: const RegisterPage(),
        ),
      ),
      GoRoute(
        path: RouteName.home,
        builder: (context, state) =>
            BlocProvider(create: (_) => HomeCubit(), child: const HomePage()),
      ),
    ],
  );
}
