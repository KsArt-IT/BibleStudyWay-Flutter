import 'package:google_sign_in/google_sign_in.dart';

abstract final class GoogleService {
  static Future<GoogleSignIn> init() async {
    return GoogleSignIn(
      scopes: ['email', 'profile'],
      forceCodeForRefreshToken: true,
    );
  }
}
