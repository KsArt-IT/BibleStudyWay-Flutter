import 'package:auth/auth.dart';
import 'package:auth/src/domain/usecases/sendPasswordResetEmailUseCase.dart';
import 'package:auth/src/presentation/screens/reset_password/cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordProviders extends StatelessWidget {
  const ResetPasswordProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final authRepository = context.read<AuthRepository>();
        final sendPasswordResetEmailUseCase = SendPasswordResetEmailUseCase(authRepository);

        return ResetPasswordCubit(
          sendPasswordResetEmailUseCase: sendPasswordResetEmailUseCase,
        );
      },
      child: child,
    );
  }
}
