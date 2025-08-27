import 'package:auth/auth.dart';
import 'package:core_common/common.dart';

class SignInWithGoogleUseCase {
  final AuthRepository _authRepository;

  SignInWithGoogleUseCase(this._authRepository);

  Future<Result<AuthUser>> call() async {
    return await _authRepository.signInWithGoogle();
  }
}
