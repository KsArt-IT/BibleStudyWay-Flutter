import 'package:auth/auth.dart';
import 'package:core_common/common.dart';

final class MockFirebaseAuthRepository implements AuthRepository {
  /// Назва репозиторію
  @override
  String get name => 'MockFirebaseAuthRepository';

  @override
  Future<Result<AuthUser>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Result<AuthUser>> refreshUser() {
    // TODO: implement refreshUser
    throw UnimplementedError();
  }

  @override
  Future<Result<AuthUser>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Result<AuthUser>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Result<AuthUser>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> sendPasswordResetEmail(String email) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> updateName({required String name}) {
    // TODO: implement updateName
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> updatePhotoURL({required String photoURL}) {
    // TODO: implement updatePhotoURL
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }
  
  @override
  Future<Result<AuthUser>> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }
}
