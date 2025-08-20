import 'package:core_common/common.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// {@template auth_service}
/// Service for working with Auth.
/// {@endtemplate}
abstract interface class AuthService {
  Future<Result<User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Result<User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Result<void>> sendPasswordResetEmail(String email);
  
  Future<Result<void>> signOut();

  bool checkIsSignIn();

  Future<Result<User>> getCurrentUser();
}