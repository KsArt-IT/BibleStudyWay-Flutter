import 'dart:developer';

import 'package:auth/auth.dart';
import 'package:bible_study_way/di/di.dart';
import 'package:bible_study_way/firebase_options.dart';
import 'package:core_settings/settings.dart';
import 'package:firebase_core/firebase_core.dart';

/// {@template di_services}
/// Клас для ініціалізації та управління сервісами програми.
///
/// Відповідає за:
/// - Ініціалізацію сервісів для роботи зі сховищем
/// - Повідомлення про прогрес ініціалізації
/// - Обробку помилок ініціалізації сервісів
/// {@endtemplate}
final class DiServices {
  /// {@macro di_services}
  DiServices();

  /// Сервіс для роботи зі сховищем
  late final StorageService storageService;

  /// Сервіс для роботи з Firebase Auth
  late final FirebaseAuth firebaseAuth;

  /// Сервіс для роботи з GoogleSignIn
  late final GoogleSignIn googleSignIn;

  /// Метод для ініціалізації сервісів в програмі.
  ///
  /// Приймає:
  /// - [onProgress] - зворотний виклик для повідомлення про прогрес ініціалізації
  /// - [diContainer] - контейнер залежностей з конфігурацією програми
  /// - [onError] - зворотний виклик для обробки помилок ініціалізації
  ///
  /// Послідовність ініціалізації:
  /// 1. Ініціалізація сервісу сховища (AppPathProvider)
  Future<void> init({
    required OnProgress onProgress,
    required OnError onError,
    required DiContainer diContainer,
  }) async {
    try {
      // Ініціалізувати сервіс для роботи з Firebase Auth та отримати екземпляр FirebaseAuth
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
      firebaseAuth = FirebaseAuth.instance;
      firebaseAuth.authStateChanges().listen((User? user) {
        if (user == null) {
          log('User is currently signed out!', name: 'FirebaseAuthService');
        } else {
          log('User is signed in!', name: 'FirebaseAuthService');
        }
      });
      onProgress('FirebaseAuth');
    } on Object catch (error, stackTrace) {
      onError('Помилка ініціалізації FirebaseAuthService', error, stackTrace);
      return;
    }
    try {
      // Отримати екземпляр GoogleSignIn
      googleSignIn = await GoogleService.init();
      onProgress('GoogleSignIn');
    } on Object catch (error, stackTrace) {
      onError('Помилка ініціалізації GoogleSignIn', error, stackTrace);
      return;
    }
    try {
      storageService = await GetStorageService.init();
      onProgress(GetStorageService.name);
    } on Object catch (error, stackTrace) {
      onError('Помилка ініціалізації ${StorageService.name}', error, stackTrace);
      return;
    }

    onProgress('Ініціалізація сервісів завершена!');
  }
}
