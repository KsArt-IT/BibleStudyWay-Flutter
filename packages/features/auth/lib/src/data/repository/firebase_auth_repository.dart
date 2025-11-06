import 'package:auth/auth.dart';
import 'package:auth/src/data/mappers/dto_to_domain.dart';
import 'package:core_common/common.dart';
import 'package:flutter/foundation.dart';

/// {@template firebase_auth_repository}
/// Repository for working with Firebase Auth.
/// {@endtemplate}
final class FirebaseAuthRepository with SafeCallMixin implements AuthRepository {
  /// {@macro firebase_auth_repository}
  FirebaseAuthRepository({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  }) : _firebaseAuth = firebaseAuth,
       _googleSignIn = googleSignIn;

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  @override
  String get name => 'FirebaseAuthRepository';

  @override
  Future<Result<AuthUser>> getCurrentUser() async {
    return safeCall(() async {
      if (_firebaseAuth.currentUser == null) {
        throw AuthFailure('', StackTrace.current, code: 'user-not-found');
      }
      return _firebaseAuth.currentUser!.toDomain();
    });
  }

  @override
  Future<Result<AuthUser>> refreshUser() async {
    await safeCall(() async {
      await _firebaseAuth.currentUser?.reload();
    });
    return getCurrentUser();
  }

  @override
  Future<Result<AuthUser>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await safeCall(() async {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    });
    return getCurrentUser();
  }

  @override
  Future<Result<AuthUser>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await safeCall(() async {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.additionalUserInfo?.isNewUser ?? false) {
        await userCredential.user!.sendEmailVerification();
      }
    });
    return getCurrentUser();
  }

  @override
  Future<Result<AuthUser>> signInWithGoogle() async {
    await safeCall(() async {
      if (kIsWeb) {
        final googleProvider = GoogleAuthProvider();

        googleProvider.addScope('email');
        // Добавляем параметр для выбора аккаунта на веб
        googleProvider.setCustomParameters({
          'prompt': 'select_account',
        });

        // Once signed in, return the UserCredential
        await FirebaseAuth.instance.signInWithPopup(googleProvider);

        return getCurrentUser();
      }
      // Authenticate with Google
      final googleUser = await _googleSignIn.authenticate(
        scopeHint: GoogleService.scopes,
      );

      // Get authorization for Firebase scopes if needed
      final authClient = _googleSignIn.authorizationClient;
      final authorization =
          // Try incremental authorization first
          await authClient.authorizationForScopes(GoogleService.scopes) ??
          // Request explicit user consent if not authorized yet
          await authClient.authorizeScopes(GoogleService.scopes);

      final credential = GoogleAuthProvider.credential(
        accessToken: authorization.accessToken,
        idToken: googleUser.authentication.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    });
    return getCurrentUser();
  }

  @override
  Future<Result<AuthUser>> signInWithApple() async {
    await safeCall(() async {
      final provider = AppleAuthProvider()
        ..addScope('email')
        ..addScope('name');
      // Вхід в Firebase з provider
      await _firebaseAuth.signInWithProvider(provider);
    });
    return getCurrentUser();
  }

  @override
  Future<Result<void>> signOut() async {
    return voidSafeCall(() async {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
    });
  }

  @override
  Future<Result<void>> sendPasswordResetEmail(String email) async {
    return voidSafeCall(() async {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    });
  }

  @override
  Future<Result<void>> updateName({required String name}) async {
    return voidSafeCall(() async {
      await _firebaseAuth.currentUser?.updateDisplayName(name);
    });
  }

  @override
  Future<Result<void>> updatePhotoURL({required String photoURL}) async {
    return voidSafeCall(() async {
      await _firebaseAuth.currentUser?.updatePhotoURL(photoURL);
    });
  }

  @override
  Future<Result<void>> deleteAccount() {
    return voidSafeCall(() async {
      await _firebaseAuth.currentUser?.delete();
    });
  }
}
