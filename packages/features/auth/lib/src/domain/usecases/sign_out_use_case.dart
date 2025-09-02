import 'package:auth/auth.dart';

class SignOutUseCase {
  final AuthRepository _authRepository;

  SignOutUseCase(this._authRepository);

  Future<void> call() {
    return _authRepository.signOut();
  }
}
