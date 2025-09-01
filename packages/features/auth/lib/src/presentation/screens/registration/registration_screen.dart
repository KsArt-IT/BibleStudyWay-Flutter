import 'package:auth/auth.dart';
import 'package:auth/src/presentation/screens/registration/bloc/registration_bloc.dart';
import 'package:core_common/common.dart';
import 'package:core_localization/localization.dart';
import 'package:core_shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.registration), centerTitle: true),
      body: BlocConsumer<RegistrationBloc, RegistrationState>(
        listener: (context, state) async {
          if (state.status == StateStatus.success) {
            context.go(AuthRoutes.loginScreenPath);
          }
          if (state.status == StateStatus.error) {
            AppSnackBar.showError(
              context,
              message: state.errorMessage ?? context.l10n.exceptionGeneral,
            );
          }
        },
        builder: (context, state) => SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                AppTextField(
                  label: context.l10n.email,
                  keyboardType: TextInputType.emailAddress,
                  errorText: state.email.value.isEmpty || state.email.isValid
                      ? null
                      : context.l10n.emailInvalid,
                  onChanged: (value) =>
                      context.read<RegistrationBloc>().add(EmailChanged(email: value)),
                ),
                const SizedBox(height: 8),
                AppPasswordTextField(
                  label: context.l10n.password,
                  errorText: state.password.value.isEmpty || state.password.isValid
                      ? null
                      : context.l10n.passwordInvalid,
                  onChanged: (value) =>
                      context.read<RegistrationBloc>().add(PasswordChanged(password: value)),
                ),
                const SizedBox(height: 8),
                AppPasswordTextField(
                  label: context.l10n.confirmPassword,
                  errorText: state.passwordConfirm.value.isEmpty || state.passwordConfirm.isValid
                      ? null
                      : context.l10n.passwordConfirmInvalid,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) =>
                      context.read<RegistrationBloc>().add(PasswordConfirmChanged(password: value)),
                ),
                const SizedBox(height: 16),
                BlocBuilder<RegistrationBloc, RegistrationState>(
                  buildWhen: (previous, current) => previous.isValid != current.isValid,
                  builder: (context, state) {
                    return AppButton(
                      label: context.l10n.registration,
                      isDisabled: !state.isValid,
                      onPressed: () => context.read<RegistrationBloc>().add(RegistrationRequest()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
