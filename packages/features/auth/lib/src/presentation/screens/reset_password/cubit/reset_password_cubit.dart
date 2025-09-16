import 'package:auth/src/domain/usecases/sendPasswordResetEmailUseCase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final SendPasswordResetEmailUseCase _sendPasswordResetEmailUseCase;
  ResetPasswordCubit({
    required SendPasswordResetEmailUseCase sendPasswordResetEmailUseCase,
  }) : _sendPasswordResetEmailUseCase = sendPasswordResetEmailUseCase,
       super(ResetPasswordInitial());

  Future<void> sendPasswordResetEmail(String email) async {
    emit(ResetPasswordLoading());
    final result = await _sendPasswordResetEmailUseCase(email);
    result.map(
      onSuccess: (_) => emit(ResetPasswordSuccess()),
      onFailure: (error) => emit(ResetPasswordFailure(errorMessage: error.toString())),
    );
  }
}
