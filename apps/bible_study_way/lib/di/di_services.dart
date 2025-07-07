import 'package:bible_study_way/di/di.dart';
import 'package:core_settings/settings.dart';

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

  /// Сервис для роботи зі сховищем
  late final StorageService storageService;

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
      storageService = await GetStorageService.init();
      onProgress(GetStorageService.name);
    } on Object catch (error, stackTrace) {
      onError(
        'Помилка ініціалізації ${StorageService.name}',
        error,
        stackTrace,
      );
      return;
    }

    onProgress('Ініціалізація сервісів завершена!');
  }
}
