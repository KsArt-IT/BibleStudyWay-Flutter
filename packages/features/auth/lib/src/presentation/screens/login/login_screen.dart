import 'dart:io';

import 'package:auth/auth.dart';
import 'package:auth/src/presentation/screens/login/cubit/login_cubit.dart';
import 'package:core_localization/localization.dart';
import 'package:core_shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var isEnabled = false;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_verifyForm);
    _passwordController.addListener(_verifyForm);
  }

  @override
  void dispose() {
    _emailController.removeListener(_verifyForm);
    _passwordController.removeListener(_verifyForm);
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    _setLoading(true);
    _setEnabled(false);
    context.read<LoginCubit>().signInWithEmailAndPassword(
      _emailController.text,
      _passwordController.text,
    );
  }

  void _onLoginGoogle() {
    _setLoading(true);
    _setEnabled(false);
    context.read<LoginCubit>().signInWithGoogle();
  }

  void _verifyForm() {
    final isValid =
        _emailController.text.trim().isNotEmpty &&
        _emailController.text.contains('@') &&
        _passwordController.text.trim().isNotEmpty;
    _setEnabled(isValid);
  }

  void _setLoading(bool value) {
    if (isLoading == value) return;
    setState(() {
      isLoading = value;
    });
  }

  void _setEnabled(bool value) {
    if (isEnabled == value) return;
    setState(() {
      isEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.login)),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.go('/', extra: state.user);
          }
          if (state is LoginFailure) {
            _setLoading(false);
            _verifyForm();
            AppSnackBar.showError(context, message: state.errorMessage);
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTextButton(
                    text: l10n.forgotPassword,
                    onPressed: () => context.goNamed(AuthRoutes.resetPasswordScreenName),
                    style: AppButtonStyle.text,
                  ),
                  const SizedBox(width: AppConstants.paddingMedium),
                  AppTextButton(
                    text: l10n.registration,
                    onPressed: () => context.goNamed(AuthRoutes.registrationScreenName),
                    style: AppButtonStyle.text,
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              AppTextField(
                label: l10n.email,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              AppPasswordTextField(label: l10n.password, controller: _passwordController),
              const SizedBox(height: AppConstants.paddingMedium),
              AppButton(
                label: l10n.login,
                onPressed: _onLogin,
                isLoading: isLoading,
                isDisabled: !isEnabled,
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppTextButton(text: l10n.apple, onPressed: () {}, style: AppButtonStyle.text),
                  if (Platform.isAndroid || Platform.isIOS || Platform.isMacOS)
                    AppTextButton(
                      text: l10n.google,
                      onPressed: _onLoginGoogle,
                      style: AppButtonStyle.text,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
