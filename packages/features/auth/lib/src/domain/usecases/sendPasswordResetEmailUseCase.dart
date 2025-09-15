import 'package:auth/auth.dart';
import 'package:core_common/common.dart';

class SendPasswordResetEmailUseCase {
  final AuthRepository _authRepository;

  SendPasswordResetEmailUseCase(this._authRepository);

  Future<Result<void>> call(String email) async {
    return await _authRepository.sendPasswordResetEmail(email);
  }
}
