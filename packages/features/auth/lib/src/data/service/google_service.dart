import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';

abstract final class GoogleService {
  static Future<GoogleSignIn> init() async {
    if (kIsWeb) {
      // Для веб-платформи ініціалізуємо з clientId
      await GoogleSignIn.instance.initialize(
        clientId: '581635287521-tpn2u69irb6uvlh9c60ah1jnvmac9jc3.apps.googleusercontent.com',
      );
    } else {
      // Для мобільних платформ використовуємо стандартну ініціалізацію
      await GoogleSignIn.instance.initialize();
    }

    return GoogleSignIn.instance;
  }

  static const scopes = ['email'];
}
