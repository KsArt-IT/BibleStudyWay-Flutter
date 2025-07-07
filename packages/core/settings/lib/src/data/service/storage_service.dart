/// {@template storage_service}
/// Інтерфейс для роботи з налаштуваннями приложения
/// {@endtemplate}
abstract interface class StorageService {
  /// Найменування інтерфейсу
  static const name = 'StorageService';

  /// Читання значення зі сховища
  Future<T?> read<T>(String key);

  /// Запис значення в сховище
  Future<void> write<T>(String key, T value);

  /// Вилучення значення зі сховища
  Future<void> delete(String key);

  /// Очищення сховища
  Future<void> clear();
}