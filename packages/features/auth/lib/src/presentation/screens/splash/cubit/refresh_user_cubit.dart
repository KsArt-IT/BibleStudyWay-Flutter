import 'package:auth/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'refresh_user_state.dart';

class RefreshUserCubit extends Cubit<RefreshUserState> {
  final AuthRepository _authRepository;

  RefreshUserCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(RefreshUserInitial()) {
    _refreshUser();
  }

  Future<void> _refreshUser() async {
    await Future.delayed(const Duration(seconds: 2));
    final result = await _authRepository.refreshUser();
    result.map(
      onSuccess: (user) => emit(RefreshUserSuccess(user)),
      onFailure: (error) => emit(RefreshUserFailure()),
    );
  }
}
