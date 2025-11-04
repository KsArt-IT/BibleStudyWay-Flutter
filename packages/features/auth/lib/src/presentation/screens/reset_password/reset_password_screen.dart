import 'package:auth/src/domain/entity/email.dart';
import 'package:auth/src/presentation/screens/reset_password/cubit/reset_password_cubit.dart';
import 'package:core_localization/localization.dart';
import 'package:core_shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _emailController = TextEditingController();
  var _isEnabled = false;

  @override
  void initState() {
    _emailController.addListener(_validateEmail);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.removeListener(_validateEmail);
    _emailController.dispose();
    super.dispose();
  }

  void _validateEmail() {
    final email = _emailController.text;
    setState(() {
      _isEnabled = Email.validate(email);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.resetPasswordTitle),
        centerTitle: true,
      ),
      body: BlocListener<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            AppSnackBar.showInfo(context, message: l10n.resetPasswordSuccess);
            context.go('/');
          }
          if (state is ResetPasswordFailure) {
            AppSnackBar.showError(context, message: state.errorMessage);
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            child: Column(
              children: [
                AppTextField(
                  controller: _emailController,
                  label: l10n.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: AppConstants.paddingMedium),
                AppButton(
                  label: l10n.send,
                  onPressed: () {
                    context.read<ResetPasswordCubit>().sendPasswordResetEmail(
                      _emailController.text,
                    );
                  },
                  isDisabled: !_isEnabled,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
