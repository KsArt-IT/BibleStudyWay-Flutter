import 'package:auth/auth.dart';
import 'package:auth/src/data/mappers/dto_to_domain.dart';
import 'package:auth/src/domain/exception/auth_exception.dart';
import 'package:core_common/common.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// {@template firebase_auth_repository}
/// Repository for working with Firebase Auth.
/// {@endtemplate}
final class FirebaseAuthRepository implements AuthRepository {
  /// {@macro firebase_auth_repository}
  FirebaseAuthRepository({required FirebaseAuth firebaseAuth, required GoogleSignIn googleSignIn})
    : _firebaseAuth = firebaseAuth,
      _googleSignIn = googleSignIn;

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  @override
  String get name => 'FirebaseAuthRepository';

  @override
  Future<Result<AuthUser>> getCurrentUser() async {
    try {
      if (_firebaseAuth.currentUser == null) {
        return Result.failure(Exception('User not found'));
      }
      return Result.success(_firebaseAuth.currentUser!.toDomain());
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<AuthUser>> refreshUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return Result.failure(Exception('User not found'));
      }
      await user.reload();
      return getCurrentUser();
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<AuthUser>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user == null) {
        return Result.failure(Exception('User not found'));
      }
      return Result.success(userCredential.user!.toDomain());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Result.failure(Exception('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        return Result.failure(Exception('Wrong password provided for that user.'));
      }
      return Result.failure(Exception(e.toString()));
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<AuthUser>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user == null) {
        return Result.failure(Exception('User not found'));
      }
      if (userCredential.isNewUser) {
        await userCredential.user!.sendEmailVerification();
      }
      return Result.success(userCredential.user!.toDomain());
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<AuthUser>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return Result.failure(Exception('Google sign in aborted'));
      }
      // Отримати idToken та accessToken
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken == null) {
        return Result.failure(Exception('Google sign in failed: no idToken'));
      }
      // Створити credential для Firebase з idToken
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Вхід в Firebase з credential
      final userCredential = await _firebaseAuth.signInWithCredential(credential);
      if (userCredential.user == null) {
        return Result.failure(Exception('User not found'));
      }
      return Result.success(userCredential.user!.toDomain());
    } on FirebaseException catch (e) {
      throw AuthException.fromFirebaseException(e);
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<AuthUser>> signInWithApple() async {
    try {
      final provider = AppleAuthProvider()
        ..addScope('email')
        ..addScope('name');
      // Вхід в Firebase з provider
      final userCredential = await _firebaseAuth.signInWithProvider(provider);
      if (userCredential.user == null) {
        return Result.failure(Exception('User not found'));
      }
      return Result.success(userCredential.user!.toDomain());
    } on FirebaseException catch (e) {
      throw AuthException.fromFirebaseException(e);
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
      return Result.success(null);
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return Result.success(null);
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateName({required String name}) async {
    return _execute((user) async {
      await user.updateDisplayName(name);
    });
  }

  @override
  Future<Result<void>> updatePhotoURL({required String photoURL}) async {
    return _execute((user) async {
      await user.updatePhotoURL(photoURL);
    });
  }

  @override
  Future<Result<void>> deleteAccount() {
    return _execute((user) async {
      await user.delete();
    });
  }

  Future<Result<void>> _execute(Future<void> Function(User) function) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return Result.failure(Exception('User not found'));
      }
      await function(user);
      return Result.success(null);
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }
}

extension on UserCredential {
  bool get isNewUser => additionalUserInfo?.isNewUser ?? false;
}
