/// Зворотний виклик за помилки ініціалізації
typedef OnError =
    void Function(String message, Object error, [StackTrace? stackTrace]);

/// Зворотний виклик під час прогресу
typedef OnProgress = void Function(String name);

/// Зворотний виклик за успішної ініціалізації
typedef OnComplete = void Function(String msg);
