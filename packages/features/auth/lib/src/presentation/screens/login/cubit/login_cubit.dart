import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SignInWithEmailAndPasswordUseCase _signInWithEmailAndPasswordUseCase;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;

  LoginCubit({
    required SignInWithEmailAndPasswordUseCase signInWithEmailAndPasswordUseCase,
    required SignInWithGoogleUseCase signInWithGoogleUseCase,
  }) : _signInWithEmailAndPasswordUseCase = signInWithEmailAndPasswordUseCase,
       _signInWithGoogleUseCase = signInWithGoogleUseCase,
       super(LoginInitial());

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final result = await _signInWithEmailAndPasswordUseCase(email: email, password: password);

    result.map(
      onSuccess: (user) => emit(LoginSuccess(user: user)),
      onFailure: (error) => emit(LoginFailure(errorMessage: error.toString())),
    );
  }

  Future<void> signInWithGoogle() async {
    final result = await _signInWithGoogleUseCase();

    result.map(
      onSuccess: (user) => emit(LoginSuccess(user: user)),
      onFailure: (error) => emit(LoginFailure(errorMessage: error.toString())),
    );
  }
}
