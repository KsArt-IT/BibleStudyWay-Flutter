import 'dart:developer';

import 'package:auth/auth.dart';
import 'package:core_common/common.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// {@template firebase_auth_service}
/// Service for working with Firebase Auth.
/// {@endtemplate}
final class FirebaseAuthService implements AuthService {
  /// {@macro firebase_auth_service}
  const FirebaseAuthService._({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;

  /// Flag to check if Firebase is initialized.
  final FirebaseAuth? _firebaseAuth;

  /// Instance of FirebaseAuthService.
  static FirebaseAuthService? _instance;

  /// Initialize Firebase Auth.
  static Future<FirebaseAuthService> init() async {
    if (_instance == null) {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          log('User is currently signed out!');
        } else {
          log('User is signed in!');
        }
      });
      _instance = FirebaseAuthService._(firebaseAuth: FirebaseAuth.instance);
    }
    return _instance!;
  }

  @override
  Future<Result<User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth!.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user == null) {
        return Result.failure(Exception('User not found'));
      }
      return Result.success(userCredential.user!);
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
  Future<Result<void>> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth!.sendPasswordResetEmail(email: email);
      return Result.success(null);
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth!.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user == null) {
        return Result.failure(Exception('User not found'));
      }
      return Result.success(userCredential.user!);
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<User>> getCurrentUser() async {
    try {
      if (_firebaseAuth!.currentUser == null) {
        return Result.failure(Exception('User not found'));
      }
      return Result.success(_firebaseAuth.currentUser!);
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      await _firebaseAuth!.signOut();
      return Result.success(null);
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateDisplayName({required String name}) async {
    try {
      await _firebaseAuth!.currentUser!.updateDisplayName(name);
      return Result.success(null);
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> updatePhotoURL({required String photoURL}) async {
    try {
      await _firebaseAuth!.currentUser!.updatePhotoURL(photoURL);
      return Result.success(null);
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }
}
