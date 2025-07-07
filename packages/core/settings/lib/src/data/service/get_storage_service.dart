import 'package:core_settings/src/data/service/storage_service.dart';
import 'package:get_storage/get_storage.dart';

/// {@template get_storage_service}
/// Реалізація StorageService для роботи з GetStorage.
/// {@endtemplate}
final class GetStorageService implements StorageService {
  /// Найменування сервісу
  static const name = 'GetStorageService';

  /// Екземпляр синглтона GetStorageService.
  static GetStorageService? _instance;

  /// Ініціалізація синглтона GetStorageService.
  /// Повертає екземпляр StorageService.
  static Future<StorageService> init() async {
    if (_instance == null) {
      await GetStorage.init();
      _instance = GetStorageService._();
    }
    return _instance!;
  }

  GetStorageService._();

  final GetStorage _box = GetStorage();

  @override
  Future<T?> read<T>(String key) async {
    return _box.read(key);
  }

  @override
  Future<void> clear() {
    return _box.erase();
  }

  @override
  Future<void> delete(String key) {
    return _box.remove(key);
  }

  @override
  Future<void> write<T>(String key, T value) {
    return _box.write(key, value);
  }
}
