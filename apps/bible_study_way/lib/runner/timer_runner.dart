import 'package:core_debug/debug.dart';

/// {@template TimerRunner}
/// Клас для підрахунку часу запуску програми
/// {@endtemplate}
class TimerRunner {
  /// {@macro TimerRunner}
  TimerRunner(this._debugService) {
    _stopwatch.start();
  }

  /// Сервіс для відлагодження
  final DebugService _debugService;

  /// Секундомер для підрахунку часу ініціалізації
  final _stopwatch = Stopwatch();

  /// Метод для зупинки секундомера і виводу часу
  /// повної ініціалізації програми
  void stop() {
    _stopwatch.stop();
    _debugService.log(
      'Час ініціалізації програми: ${_stopwatch.elapsedMilliseconds} мс',
    );
  }

  /// Метод для обробки прогресу ініціалізації залежностей
  void logOnProgress(String name) {
    _debugService.log(
      '$name успішна ініціалізація, прогрес: ${_stopwatch.elapsedMilliseconds} мс',
    );
  }

  /// Метод для обробки прогресу ініціалізації залежностей
  void logOnComplete(String message) {
    _debugService.log(
      '$message, прогрес: ${_stopwatch.elapsedMilliseconds} мс',
    );
  }

  /// Метод для обробки прогресу ініціалізації залежностей
  void logOnError(String message, Object error, [StackTrace? stackTrace]) {
    _debugService.logError(() => message, error: error, stackTrace: stackTrace);
  }
}
