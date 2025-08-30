import 'package:auth/auth.dart';
import 'package:auth/src/domain/usecases/sign_in_with_email_and_password_use_case.dart';
import 'package:auth/src/domain/usecases/sign_in_with_google_use_case.dart';
import 'package:auth/src/presentation/screens/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginProviders extends StatelessWidget {
  const LoginProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final authRepository = context.read<AuthRepository>();
        final signInWithEmailAndPasswordUseCase = SignInWithEmailAndPasswordUseCase(authRepository);
        final signInWithGoogleUseCase = SignInWithGoogleUseCase(authRepository);
        return LoginCubit(
          signInWithEmailAndPasswordUseCase: signInWithEmailAndPasswordUseCase,
          signInWithGoogleUseCase: signInWithGoogleUseCase,
        );
      },
      child: child,
    );
  }
}
