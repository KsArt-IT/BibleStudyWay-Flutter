import 'package:auth/auth.dart';
import 'package:auth/src/domain/usecases/sign_up_with_email_and_password_use_case.dart';
import 'package:auth/src/presentation/screens/registration/bloc/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationProviders extends StatelessWidget {
  const RegistrationProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final authRepository = context.read<AuthRepository>();
        final signUpWithEmailAndPasswordUseCase = SignUpWithEmailAndPasswordUseCase(authRepository);

        return RegistrationBloc(
          signUpWithEmailAndPasswordUseCase: signUpWithEmailAndPasswordUseCase,
          signOutUseCase: context.read<SignOutUseCase>(),
        );
      },
      child: child,
    );
  }
}
