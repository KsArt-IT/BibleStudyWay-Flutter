import 'package:auth/auth.dart';
import 'package:auth/src/data/mappers/dto_to_domain.dart';
import 'package:core_common/common.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// {@template firebase_auth_repository}
/// Repository for working with Firebase Auth.
/// {@endtemplate}
final class FirebaseAuthRepository implements AuthRepository {
  /// {@macro firebase_auth_repository}
  FirebaseAuthRepository({required AuthService authService, required GoogleSignIn googleSignIn})
    : _authService = authService,
      _googleSignIn = googleSignIn;

  final AuthService _authService;
  final GoogleSignIn _googleSignIn;

  @override
  String get name => 'FirebaseAuthRepository';

  @override
  Future<Result<AuthUser>> getCurrentUser() async {
    final result = await _authService.getCurrentUser();
    return result.map(
      onSuccess: (user) => Result.success(user.toDomain()),
      onFailure: (error) => Result.failure(error),
    );
  }

  @override
  Future<Result<void>> sendPasswordResetEmail(String email) async {
    return await _authService.sendPasswordResetEmail(email);
  }

  @override
  Future<Result<AuthUser>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final result = await _authService.signInWithEmailAndPassword(email: email, password: password);
    return result.map(
      onSuccess: (user) => Result.success(user.toDomain()),
      onFailure: (error) => Result.failure(error),
    );
  }

  @override
  Future<Result<AuthUser>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final result = await _authService.signUpWithEmailAndPassword(email: email, password: password);
    return result.map(
      onSuccess: (user) => Result.success(user.toDomain()),
      onFailure: (error) => Result.failure(error),
    );
  }

  @override
  Future<Result<void>> updatePhotoURL({required String photoURL}) async {
    return await _authService.updatePhotoURL(photoURL: photoURL);
  }

  @override
  Future<Result<void>> updateName({required String name}) async {
    return await _authService.updateDisplayName(name: name);
  }

  @override
  Future<Result<AuthUser>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      await _authService.signOut();
      await _googleSignIn.signOut();
      return Result.success(null);
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }
}
