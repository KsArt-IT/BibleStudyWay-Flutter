import 'package:auth/auth.dart';
import 'package:auth/src/presentation/screens/splash/cubit/refresh_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashProviders extends StatelessWidget {
  const SplashProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final repository = context.read<AuthRepository>();
            return RefreshUserCubit(authRepository: repository);
          },
        ),
      ],
      child: BlocListener<RefreshUserCubit, RefreshUserState>(
        listener: (context, state) => switch (state) {
          RefreshUserInitial() => null,
          RefreshUserSuccess(user: final user) => context.go('/', extra: user),
          RefreshUserFailure() => context.goNamed(AuthRoutes.loginScreenName),
        },
        child: const SplashScreen(),
      ),
    );
  }
}
