import 'package:auth/src/mock/mock_firebase_auth.dart';

abstract final class MockFirebaseAuthService {
  const MockFirebaseAuthService._();

  static Future<MockFirebaseAuth> init() async {
    return MockFirebaseAuth();
  }
}
