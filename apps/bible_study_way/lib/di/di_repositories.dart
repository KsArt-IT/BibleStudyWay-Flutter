import 'package:auth/auth.dart';
import 'package:bible_study_way/di/di.dart';
import 'package:core_common/common.dart';
import 'package:core_config/config.dart';
import 'package:core_settings/settings.dart';

/// Список назв мокових репозиторіїв, які мають бути підмінені
/// для використання у складання стадії оточення.
///
/// Для того, щоб репозиторій був автоматично підмінений на моковий у stage
/// складання, необхідно в цьому списку вказати назву мокового репозиторію,
/// Звертаючись до відповідного поля name.
///
/// Приклад:
/// ```
///   [ MockAuthRepository().name, ]
/// ```
final List<String> _mockReposToSwitch = [];

/// {@template di_repositories}
/// Клас для ініціалізації та управління репозиторіями програми.
///
/// Відповідає за:
/// - Ініціалізацію репозиторіїв для роботи з даними
/// - Автоматичне переключення між моковими та реальними репозиторіями
/// - Повідомлення про прогрес ініціалізації
/// - Обробку помилок ініціалізації репозиторіїв
///
/// Стратегія ініціалізації по оточенням:
/// - dev: завжди використовуються мокові репозиторії
/// - prod: завжди використовуються реальні репозиторії
/// - stage: використовуються мокові репозиторії зі списку _mockReposToSwitch
/// {@endtemplate}
final class DiRepositories {
  /// {@macro di_repositories}
  DiRepositories();

  /// Інтерфейс для роботи з репозиторієм налаштувань
  late final SettingsRepository settingsRepository;

  /// Інтерфейс для роботи з репозиторієм авторизації
  late final AuthRepository authRepository;

  /// Метод для ініціалізації репозиторіїв у програмі.
  ///
  /// Приймає:
  /// - [onProgress] - зворотний виклик для повідомлення про прогрес ініціалізації
  /// - [diContainer] - контейнер залежностей з конфігурацією програми
  /// - [onError] - зворотний виклик для обробки помилок ініціалізації
  ///
  /// Послідовність ініціалізації:
  /// 1. Ініціалізація репозиторію налаштувань
  void init({
    required OnProgress onProgress,
    required OnError onError,
    required DiContainer diContainer,
  }) {
    try {
      // Инициализация репозитория для работы с Firebase Auth
      authRepository = _lazyInitRepo<AuthRepository>(
        environment: diContainer.env,
        onProgress: onProgress,
        mockFactory: MockFirebaseAuthRepository.new,
        mainFactory: () => FirebaseAuthRepository(
          firebaseAuth: diContainer.services.firebaseAuth,
          googleSignIn: diContainer.services.googleSignIn,
        ),
      );
    } on Object catch (error, stackTrace) {
      onError('Помилка ініціалізації AuthRepository', error, stackTrace);
    }
    try {
      // Ініціалізація репозиторію сервісу управління токеном доступу
      settingsRepository = _lazyInitRepo<SettingsRepository>(
        mockFactory: MockSettingsRepository.new,
        mainFactory: () => LocalSettingsRepository(storage: diContainer.services.storageService),
        onProgress: onProgress,
        environment: diContainer.env,
      );
      onProgress(settingsRepository.name);
    } on Object catch (error, stackTrace) {
      onError('Помилка ініціалізації репозиторію SettingsRepository', error, stackTrace);
    }

    onProgress(
      'Ініціалізацію репозиторіїв завершено! Було підмінено репозиторіїв - ${_mockReposToSwitch.length} (${_mockReposToSwitch.join(', ')})',
    );
  }

  /// Метод для ленивої ініціалізації конкретного репозиторію по типу [Т].
  /// В залежності від оточення ініціалізується моковий або сетевий репозиторій.
  ///
  /// Приймає:
  /// - [mockFactory] - функція-фабрика для ініціалізації мокового репозиторію
  /// - [mainFactory] - функція-фабрика для ініціалізації основного репозиторію
  /// - [onProgress] - зворотний виклик для повідомлення про прогрес ініціалізації
  /// - [environment] - оточення програми для визначення стратегії ініціалізації
  ///
  /// Повертає:
  /// - Екземпляр репозиторію в залежності від оточення
  T _lazyInitRepo<T extends DiBaseRepo>({
    required AppEnv environment,
    required T Function() mainFactory,
    required T Function() mockFactory,
    required OnProgress onProgress,
  }) {
    final mockRepo = mockFactory();
    final mainRepo = mainFactory();

    final repo = switch (environment) {
      AppEnv.dev => mainRepo,//mockRepo,
      AppEnv.prod => mainRepo,
      AppEnv.stage => _mockReposToSwitch.contains(mockRepo.name) ? mockRepo : mainRepo,
    };

    onProgress(repo.name);
    return repo;
  }
}
