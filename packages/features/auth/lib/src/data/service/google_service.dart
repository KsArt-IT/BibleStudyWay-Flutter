import 'package:google_sign_in/google_sign_in.dart';

abstract final class GoogleService {
  static Future<GoogleSignIn> init() async {
    final instance = GoogleSignIn.instance;
    await instance.initialize();
    return instance;
  }

  static const scopes = ['email'];
}
