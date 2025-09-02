import 'package:auth/auth.dart';
import 'package:core_common/common.dart';

class SignUpWithEmailAndPasswordUseCase {
  final AuthRepository _authRepository;

  SignUpWithEmailAndPasswordUseCase(this._authRepository);

  Future<Result<AuthUser>> call({
    required String email,
    required String password, //
  }) async {
    return await _authRepository.signUpWithEmailAndPassword(
      email: email,
      password: password, //
    );
  }
}
