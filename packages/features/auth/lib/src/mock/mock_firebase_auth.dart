import 'package:auth/auth.dart';

final class MockFirebaseAuth {
  AuthUser? _currentUser;

  AuthUser? get currentUser => _currentUser;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    _currentUser = AuthUser(
      uid: '1',
      email: email,
      name: 'Test',
      photoUrl: 'https://via.placeholder.com/150',
    );
  }
}
