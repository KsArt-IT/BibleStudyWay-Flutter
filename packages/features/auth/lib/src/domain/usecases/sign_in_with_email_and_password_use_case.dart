import 'package:auth/auth.dart';
import 'package:core_common/common.dart';

class SignInWithEmailAndPasswordUseCase {
  final AuthRepository _authRepository;

  SignInWithEmailAndPasswordUseCase(this._authRepository);

  Future<Result<AuthUser>> call({
    required String email,
    required String password, //
  }) async {
    return await _authRepository.signInWithEmailAndPassword(
      email: email,
      password: password, //
    );
  }
}
