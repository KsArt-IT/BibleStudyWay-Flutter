import 'package:core_common/common.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// {@template auth_service}
/// Service for working with Auth.
/// {@endtemplate}
abstract interface class AuthService {
  /// Sign in with email and password.
  Future<Result<User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Sign up with email and password.
  Future<Result<User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Send password reset email.
  Future<Result<void>> sendPasswordResetEmail(String email);

  /// Sign out.
  Future<Result<void>> signOut();

  /// Get current user.
  Future<Result<User>> getCurrentUser();

  /// Update [displayName]
  Future<Result<void>> updateDisplayName({required String name});

  /// Update [photoURL] 
  Future<Result<void>> updatePhotoURL({required String photoURL});
}